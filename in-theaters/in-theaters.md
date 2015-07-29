JSON is popular data format used for transferring information around the web and can be readily converted to Ruby data structures (i.e. Arrays and Hashes). In this challenge we'll extract information from a JSON file taken from the [Rotten Tomatoes API][rotten_tomatoes_api] to display the list of movies in theaters.

### Learning Goals

* Extract specific information from a compound data structure (i.e. nested arrays and hashes).
* Utilize an API to retrieve current information.

### Instructions

Add functionality to the `in_theaters.rb` file to extract and print the following information from the `movie_data` hash:

* The list of movies in theaters now:

```no-highlight
In Theaters Now:

The Amazing Spider-Man 2
Legends of Oz: Dorothy's Return
Neighbors
...
```

* The MPAA rating along with each movie:

```no-highlight
In Theaters Now:

The Amazing Spider-Man 2 (PG-13)
Legends of Oz: Dorothy's Return (PG)
Neighbors (R)
...
```

* The average of the critics and audience scores:

```no-highlight
In Theaters Now:

63 - The Amazing Spider-Man 2 (PG-13)
51 - Legends of Oz: Dorothy's Return (PG)
76 - Neighbors (R)
...
```

* Up to the first three cast members listed for the movie:

```no-highlight
In Theaters Now:

63 - The Amazing Spider-Man 2 (PG-13) starring Andrew Garfield, Emma Stone, Jamie Foxx
51 - Legends of Oz: Dorothy's Return (PG) starring Lea Michele, Jim Belushi, Dan Aykroyd
76 - Neighbors (R) starring Seth Rogen, Rose Byrne, Zac Efron
...
```

* The same information but sorted by highest rating first:

```no-highlight
In Theaters Now:

 91 - Captain America: The Winter Soldier (PG-13) starring Chris Evans, Anthony Mackie, Sebastian Stan
 90 - The Grand Budapest Hotel (R) starring Saoirse Ronan, Ralph Fiennes, Bill Murray
 85 - Bears (G) starring John C. Reilly
...
```

#### Extra Challenge - API Keys

Right now the program can extract the required information but requires manually downloading a recent JSON file to see the current movies. Instead, we can have our program download the JSON directly from the Rotten Tomatoes API.

You can sign up for an API key by visiting [the Rotten Tomatoes API page][rotten_tomatoes_api]. Once you have the key, set it as an environment variable:

```no-highlight
$ export ROTTEN_TOMATOES_API_KEY=<YOUR_API_KEY>
$ echo $ROTTEN_TOMATOES_API_KEY
<YOUR_API_KEY>
```

We'll use the [In Theaters API Call][in_theaters_api_call] to retrieve the JSON data. Add the following to the top of your program:

```ruby
require "json"
require "net/http"

if !ENV.has_key?("ROTTEN_TOMATOES_API_KEY")
  puts "You need to set the ROTTEN_TOMATOES_API_KEY environment variable."
  exit 1
end

api_key = ENV["ROTTEN_TOMATOES_API_KEY"]
uri = URI("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=#{api_key}")

response = Net::HTTP.get(uri)
movie_data = JSON.parse(response)
```

Now when you run your program, it will retrieve the latest results directly from the Rotten Tomatoes website.

We want to avoid sharing our API keys since those are linked to our individual accounts and can be abused by other users if they were publicly known. Since we're storing the API key in an environment variable it is not explicitly included in our codebase. If another developer wanted to use our program, they could sign up for their own API key and set it as their environment variable to achieve the same result.

[in_theaters_api_call]: http://developer.rottentomatoes.com/docs/read/json/v10/In_Theaters_Movies
[rotten_tomatoes_api]: http://developer.rottentomatoes.com/
