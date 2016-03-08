Remembering users from one request to the next is an important part of many web application flows. In this article we'll discuss how we can use HTTP cookies as a way of linking several requests together into a single user session.

### Learning Goals

* Learn how HTTP cookies are used to save information between requests.
* Store and retrieve session data within a Sinatra application.
* Understand how HMAC digests can be used to detect cookies that have been tampered with.

### Remembering State

HTTP is a stateless protocol. Each HTTP request-response cycle is treated independently. Our web server does not need to remember anything about past requests. It does not have to maintain any **state**.

This aspect of HTTP simplifies request handling, but it doesn't mirror how we always interact with web sites. Often, we visit several pages on a site and expect that the server has some way to remember our interaction with the website. For example, if we visit one page to log into a site, we expect the next page to remember that we're authenticated. If we add items to a cart, we expect the subsequent pages to remember the items we've added so far.

We can think of a series of requests from a single user as being part of a single **session**. Within this session, we might include some information that we want to remember such as their username, what items are in their cart, display preferences, etc. When that user visits the next page on our app, we want to associate that request with their previous session so we can access these bits of information.

### HTTP Cookies

Given that each HTTP request and response is handled independently by the web server, how can we tie multiple requests from the same user together? A common solution to this problem is to send the session information _attached with the HTTP response_ and have the browser include it with the next request it sends. This information is attached by setting an **HTTP cookie**.

Cookies are included via HTTP headers in both the request and response. Consider a website that wants to track how often a user visits a page. The first request sent is a simple GET request without any additional information:

```
GET / HTTP/1.1
Host: example.com
```

The server will generate a response containing the HTML body but it also might include a cookie that tracks the number of times the page has been visited:

```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 178
Set-Cookie: visit_count=1

<!DOCTYPE html>
<html>
  <head><title>Welcome!</title></head>
  <body>
    <h1>Greetings!</h1>

    <p>This appears to be your first time visiting the page!</p>
  </body>
</html>
```

The `Set-Cookie: visit_count=1` header instructs the browser to save this key-value pair and associate it with the _example.com_ domain. The next request we send to that site will include the additional `Cookie` header:

```
GET /about.html HTTP/1.1
Host: example.com
Cookie: visit_count=1
```

When the web server handles this request, it notices the cookie indicating the user has visited one time previously. It can use this information to generate a different page as well as incrementing the visit counter:

```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 176
Set-Cookie: visit_count=2

<!DOCTYPE html>
<html>
  <head><title>Welcome!</title></head>
  <body>
    <h1>Welcome back!</h1>

    <p>You have visited this page 1 time(s) previously.</p>
  </body>
</html>
```

Cookies can store arbitrary key-value pairs but the HTTP standard specifies that browsers only need to support 4K worth of data. It's best to avoid storing large chunks of data to avoid hitting this limit and also to reduce the bandwidth required to pass those values back and forth over the network.

Unless otherwise specified, browsers will only store a cookie as long as the browser window is open. These are known as **session cookies**. It is also possible to include an expiration date so that browsers know to keep these cookies around until the specified date has been hit:

```no-highlight
Set-Cookie: visit_count=1; Expires=Fri, 27 Feb 2015 10:18:14 GMT
```

Because cookies are stored in the client's browser, it is possible for a user to delete a cookie at any time. This will lose any information that was previously set and the user will be treated as if it was the first time they were visiting the page on the next request. Because we can't guarantee the lifetime of information stored in cookies, only use them for storing temporary settings or preferences that can be easily re-created if needed. Anything that needs to exist longer term should be stored in a more permanent setting such as a database.

### Handling Sensitive Information

Rather than deleting information, a more insidious scenario would involve users tampering with values set in the cookie. A popular use case for cookies is to remember when a user has logged into a web site. After successful authentication the web server might set a cookie with their username:

```
HTTP/1.1 302 Found
Location: http://www.example.com/
Set-Cookie: username=gorthon_the_thief
```

The next time the user visits the page, it includes the `Cookie: username=gorthon_the_thief` header so that the web server remembers that this request has already been authenticated. Since cookies are stored on the browser and the information is part of the request, it's possible for a user to modify the value for subsequent requests:

```
GET /account_settings HTTP/1.1
Host: example.com
Cookie: username=logan_the_huge
```

Just by changing a header in the request, Gorthon the Thief is now logged in as Logan the Huge! Storing sensitive information directly in a cookie is an easy attack vector for malicious users.

We can't actually prevent a user from modifying or deleting their cookies since we just read whatever comes over the network. What we can do instead is to try and _detect_ when the data has been tampered with. We can do this by including an [HMAC](http://en.wikipedia.org/wiki/Hash-based_message_authentication_code) with the session data:

```
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 18
Set-Cookie: username=gorthon_the_thief--6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4
```

The string `"6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4"` is our message authentication code and can only be generated using our session data and some secret key:

```ruby
require "openssl"

def generate_hmac(data, secret)
  OpenSSL::HMAC.hexdigest(OpenSSL::Digest::SHA1.new, secret, data)
end

def build_cookie(data, hmac)
  "#{data}--#{hmac}"
end

session_data = "username=gorthon_the_thief"
secret = "super_secret_key"

session_hmac = generate_hmac(session_data, secret)
#=> "6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4"

new_cookie = secure_cookie(session_data, session_hmac)
#=> "username=gorthon_the_thief--6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4"
```

The method `build_cookie` combines the two components of the cookie string: the data (`username=gorthon_the_thief`) and the HMAC digest (`6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4`). The actual means by which the `hexdigest` function works is outside the scope of this article, and falls within the realm of [cryptography](https://en.wikipedia.org/wiki/Cryptography). What is important though is the **secret key**, which exists on the server, but is unknown by the client, and very difficult to guess. This key allows us to generate these HMAC digests and use them to verify the session data was not tampered with in transit. When the client sends a subsequent request, we expect them to include the HMAC digest so we can verify the original data matches:

```
GET /account_settings HTTP/1.1
Host: example.com
Cookie: username=gorthon_the_thief--6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4
```

If the client attempts to alter the username, they won't be able to generate a new HMAC because they don't know the secret:

```
GET /account_settings HTTP/1.1
Host: example.com
Cookie: username=logan_the_huge--6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4
```

Our web server can check that the new session data does not match the given HMAC and therefore detect that the session has been tampered with:

```ruby
# This is the information the malicious client sent after tampering
# with the username.
session_data = "username=logan_the_huge"
supplied_hmac = "6df4a65ff0eac94f1012e8e3e6ecbb0b36af46e4"

# Only the server has access to this secret and can use it to verify
# the HMAC.
secret = "super_secret_key"

# The valid HMAC differs from the one the user supplied
valid_hmac = generate_hmac(session_data, secret)
#=> "83db2b2fa307704ef00e7150607461da7979e94c"

if supplied_hmac != valid_hmac
  # user has tampered with session, don't trust anything!
else
  # business as usual...
end
```

It's not so important to understand the details of this process as it is to understand the importance of having a secret key. If the client has access to this secret key, they can modify the session data and forge a new HMAC that appears valid to the server. If the key was ever leaked, it is important to generate and deploy a new one as soon as possible to prevent users from modifying their session undetected.

### Setting and Reading Session Data

To use sessions within Sinatra, we need to enable them so that our HTTP responses include the `Set-Cookie` header. Within a *server.rb* file, include the following configuration:

```ruby
require "sinatra"

use Rack::Session::Cookie, {
  secret: "change_me",
  expire_after: 86400 # seconds
}
```

This will set a cookie that includes an HMAC created using the given secret and will expire after one day.

To save or retrieve data from the user's session we can use the `session` hash within our app:

```ruby
get "/" do
  # Check to see if the session contains a visit counter already. If this is
  # the first time visiting the site the value will be nil.
  if session[:visit_count].nil?
    visit_count = 1
  else
    # Everything in the session is stored as key-value strings. We need to
    # convert back to an integer before we can use this value in our app.
    visit_count = session[:visit_count].to_i
  end

  session[:visit_count] = visit_count + 1

  "You've visited this page #{visit_count} time(s).\n"
end
```

To add a new value to the session we simply add a new key to the hash: `session[:some_key] = some_value`. This will include it within the cookie that gets sent back on subsequent requests so we can access the value with `session[:some_key]`.

As long as we're using a secret key to authenticate our sessions, we can be confident that the session data we're getting back is valid. Users still have the option to delete their cookies which means that we have no guarantee if we set a value we'll get it back. Only store information in sessions that can be easily recreated if needed (e.g. if a user deletes their cookie and is signed out, they can easily sign back in to recreate their state).

### In Summary

When we need to remember information from one request to the next, we want to somehow link these requests into a single **session**. A session contains information about the user that we can access the next time they visit our application.

Sessions are typically implemented using **HTTP cookies**. A cookie is a chunk of information that gets included as an HTTP header in the response that the client will send back in subsequent requests. Cookies are often limited to 4K in size and are stored within the users browser. We can use **HMAC digests** to verify the authenticity of session data but we cannot guarantee that they won't be deleted.

Once sessions are enabled in Sinatra we have access to the `session` hash. This allows us to store and retrieve string values assigned to keys.

Because cookies can be deleted at any time it is important to avoid storing information that cannot easily be recreated. Prefer a more permanent storage solution such as a database for storing this type of information.
