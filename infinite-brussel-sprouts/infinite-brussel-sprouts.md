Over exertion from having to refresh a web page too many times is reaching critical conditions among sedentary web users. In this challenge we'll solve this epidemic by ensuring our users never have to refresh the page to receive updates about their favorite vegetable.

### Instructions

An existing Sinatra application has been provided that displays recent tweets about brussel sprouts. To start the application run:

```no-highlight
$ ruby server.rb
```

Visiting [http://localhost:4567/tweets](http://localhost:4567/tweets) will take you to the list of tweets. Since there are a large number of them, it only shows a fixed amount of tweets on the initial page load. If a user wants to see more they have to click a link taking them to [http://localhost:4567/tweets?page=2](http://localhost:4567/tweets?page=2).

Rather than having the user visit a separate page, add some JavaScript to *public/js/sprouts.js* so that when a user clicks on the link to request more content, it updates the page in place with the next set of tweets. The server already includes a JSON API at [http://localhost:4567/tweets.json](http://localhost:4567/tweets.json) to retrieve the tweets for the first page (add the `page=<PAGE_NUMBER>` parameter to request subsequent sets of tweets).

You should **not** modify the *server.rb* file for this challenge. Also note that jQuery has already been loaded in the HTML and can be used in the *public/js/sprouts.js* file.

### Infinite Scroll (Optional)

As an additional challenge, remove the link and initiate the request for more tweets when the user scrolls to the end of the page. Be mindful that the **scroll** event is triggered repeatedly while the user is scrolling the page and avoid sending duplicate or out-of-order requests.

A subset of users that enjoy dressing up in tin foil also disable JavaScript in their browsers for security or privacy reasons. If you remove the link to enable infinite scroll, ensure that it is still possible for users without JavaScript running to access subsequent pages of tweets.
