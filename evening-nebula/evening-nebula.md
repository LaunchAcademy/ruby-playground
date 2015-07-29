A test-based learning suite for learning JavaScript fundamentals.

# Learn JavaScript Through Tests

This repo is a fork of [Rebecca Murphey](https://github.com/rmurphey)'s [js-assessment](https://github.com/rmurphey/js-assessment). The goal is to build a test-based learning suite for JavaScript.

## How do I set this up?
To use the tests, you will need to install Node -- you can do this via the
[download page](https://nodejs.org/download/) or using
[Homebrew](http://mxcl.github.com/homebrew/) if you are on a Mac.

Once you've installed Node, run the following from your command line:

```
npm install
npm start
```

Then, point your browser to [http://localhost:4444](http://localhost:4444):

![alt](http://i.imgur.com/uzpfVGV.png)

You should see that all the tests are failing. Oh no! Whatever shall we do.

Your job is to update the `.js` files in the `app` folder to get the tests to pass. You can find the tests in the `tests/app` folder. Reload the page to see whether your code updates worked:

![alt](http://i.imgur.com/IygAP58.png)

### Tips & Hints!

* The tests are not to be modified! Only modify the code in the files in the `app` directory!
* Use `console.log` and `debugger` to help you debug and trace your code!

### Available dependencies

The repo supports jQuery, Backbone and Underscore, so those libraries are available to you to draw from!
