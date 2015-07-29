In the world of web development, HTML is responsible for defining the structure of a page. CSS is responsible for the fonts, color, and styling of HTML elements. JavaScript executed within the client's browser, allows us to make dynamic changes to the structure and styling of the rendered document.

We make these dynamic changes on the DOM, or Document Object Model. This is an object-oriented representation the web page, which we can modify via JavaScript.

```javascript
var paragraphs = document.getElementsByTagName("p");
```

Open up the JavaScript console in Chrome with `Command + Option + J`, and dynamically alter this document with the code above.

The code in this example, calls the `#getElementsByTagName()` function of the `document` object. The `paragraphs` variable will contain a collection of elements, which, in JavaScript, is called a `nodeList`. There are a few JavaScript data types we should familiarize ourselves with:

Try typing `document;` into the JavaScript console. You can expand the properties of this object by clicking the arrow to the left of the returned object.

## JavaScript DOM Data Types

* document - An object-oriented representation of the document we are looking at, from the starting `<!DOCTYPE html>` tag element, all the way to the closing `</html>` tag element.
* element - Typically, a single HTML tag and its contents, such as `<title>Google</title>`.
* nodeList - A collection of elements. We will get a nodeList back from a document query that has multiple matches, such as selecting all the `div` elements in a page.
* attribute - This is the same as an attribute on an HTML tag, such as `href="http://google.com/"`.


## Dynamic Additions

With the `createElement` and `appendChild` functions, we can add content to the page via JavaScript.

```javascript
var paragraph = document.createElement("p");
var text = document.createTextNode("Make it Dynamic!");
paragraph.appendChild(text);

var body = document.getElementsByTagName("body")[0];
body.appendChild(paragraph);
```

In order to dynamically add content to the page, we must first create a paragraph element, create a `textNode`, append the text node to the paragraph, and then append the paragraph to some location in the page. In this case, we just added it to the bottom of the page.

There is a bit of complexity, here. It could be worthwhile to pull this out into a reusable function.

```javascript
var appendElement = function(target, tag, text) {
  var element = document.createElement(tag);
  var textNode = document.createTextNode(text);
  element.appendChild(textNode);
  target.appendChild(element);
}

var body = document.getElementsByTagName("body")[0];
appendElement(body, "p", "Make it Dynamic!");
```

## Dynamic Styling

Perhaps we don't like the designer's choice of font. Changing it is easy.

```javascript
var body = document.getElementsByTagName("body")[0];
body.style.fontFamily = '"Andale Mono",AndaleMono,monospace';
```

With the `element.style` function, we can change any and all CSS properties of the page. In CSS, if we wanted to set the font, we would have code that looks like the following:

```css
body {
  font-family: "Andale Mono", AndaleMono, monospace
}
```

Any keywords that contain a dash would need to be translated to camelCase when utilizing `element.style`. For example, to set the `background-color` of the body, we would need to set `body.style.backgroundColor = "grey";`.


## Getting and Setting Attributes

```html
<!-- html -->
<a id="search-link" href="http://google.com/">Search</a>
```

```javascript
// js
var link = document.getElementById("search-link");
var url = link.getAttribute("href");
console.log(url);
link.setAttribute("href", "http://duckduckgo.com/");
```

In the example above, we are able to retrieve the `href` attribute of the link with the `getAttribute` function, and then we print it to the console. Using the `setAttribute` function, we then change the `Search` link to a different search engine.

Try it yourself: <a id="search-link" href="http://google.com/">Search</a>


## Binding Actions to Events

We can dynamically change the page the client is viewing by binding functions to events. We can do this via the `addEventListener` function.

```javascript
var changeFontColor = function() {
  var colors = ["Aqua", "Blue", "Cyan", "Green", "LightGray", "LightSteelBlue"];
  var index = Math.floor(Math.random() * colors.length);
  var color = colors[index];
  this.style.color = color;
}

var paragraph = document.getElementById("moby-dick-chapter-1");
paragraph.addEventListener("click", changeFontColor, false);
```

In the example above, we have bound a function to an element in the page with an id of `id="moby-dick-chapter-1"`. When the user clicks on this element, the `changeFontColor` function is executed.

If you are curious, [here](https://developer.mozilla.org/en-US/docs/Web/Events) is a list of all the events you can bind to.


## Moby Dick - Chapter 1

<div class="moby-dick-chapter-1">
  Call me Ishmael. Some years ago- never mind how long precisely- having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people's hats off- then, I account it high time to get to sea as soon as I can...
</div>


## Window Loading

Suppose we want to have some code execute after all of the assets (js, css, images) have been loaded into the page.

```javascript
window.onload = function() {
  console.log("window loaded.");
}
```


## Scrolling

Use the `window.scrollTo()` function to scroll 1000 pixels down the page.

```javascript
window.scrollTo(0, 1000);
```

## Conclusion

This has been a tour of the most commonly used JavaScript functions to dynamically change the DOM. Your ability to alter the page the client is viewing is only limited to the functions provided to you and your imagination.


## References
* [Introduction to the Document Object Model](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
* [The Basics of JavaScript DOM Manipulation](http://callmenick.com/post/basics-javascript-dom-manipulation)
