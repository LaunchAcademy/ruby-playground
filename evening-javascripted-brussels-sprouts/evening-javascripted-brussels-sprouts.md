## OMG Someone Mixed Our Precious Brussels Sprouts Recipes with Bad Ones!

### Instructions
We were ambling along, coding away happily on our Brussels Sprouts Recipe work until someone mixed non-Brussels Sprouts recipes into our nice `dishes` array. What are we going to do?! Help figure out which ones we care about and which ones we don't!

Using JavaScript, do the following:

* Grab the recipes in the `dishes` array and split the ones that include "Brussels Sprout" in their title from the ones that do not.
* Generate two new arrays `goodDishes` and `badDishes` that contain recipes with "Brussels Sprout" in their title and ones that do not, respectively.
* Add the items in the `goodDishes` array to list items in the page.
* [Prevent](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault) the "New Recipe" form from submitting and add the content from the input box to the page.

### Learning Goals
* Understand the basics of JavaScript syntax.
* Utilize the browser console to write and debug JavaScript code.
* Implement `console.log` to see data output on the browser console.

### Instructions

* `et get` this lesson
* `open index.html` in Chrome
* The following `dishes` array will be defined for you:

```
var dishes = [
  "Roasted Brussels Sprouts",
  "Truffel Salt Burrito",
  "Vegan Philly Style Cheese Steak",
  "Fresh Brussels Sprouts Soup",
  "Split Pea Pizza with Cherry Tomatoes and Chocolate Shavings",
  "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon",
  "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries",
  "Parmesan Toast with Green Onions and Thyme",
  "Hot Cheesy Roasted Brussels Sprout Dip",
  "Gazpacho with Lime and Potato Sauce",
  "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro",
  "Roasted Brussels Sprout and Red Potato Salad",
  "Smoked Gouda and Poppy Seed Crackers",
  "Smoky Buttered Brussels Sprouts",
  "Margherita Pizza with Mushrooms and Canteloupe",
  "Orange Glazed Vegan Chicken Cutlet",
  "Sweet and Spicy Roasted Brussels Sprouts",
  "Smoky Buttered Brussels Sprouts",
  "Jelly Bean Ice Cream",
  "Brussels Sprouts and Egg Salad with Hazelnuts"]
```

### Output

Running your code in your browser console should result in the following (though the right side containing notifications like `VM733:9` will likely be different):

![alt](http://i.imgur.com/hP4JSDV.png)

Calling variables `goodDishes` and `badDishes` from your browser console should result in the following:

```
goodDishes;
["Roasted Brussels Sprouts", "Fresh Brussels Sprouts Soup", "Brussels Sprouts with Toasted Breadcrumbs, Parmesan, and Lemon", "Cheesy Maple Roasted Brussels Sprouts and Broccoli with Dried Cherries", "Hot Cheesy Roasted Brussels Sprout Dip", "Pomegranate Roasted Brussels Sprouts with Red Grapes and Farro", "Roasted Brussels Sprout and Red Potato Salad", "Smoky Buttered Brussels Sprouts", "Sweet and Spicy Roasted Brussels Sprouts", "Smoky Buttered Brussels Sprouts", "Brussels Sprouts and Egg Salad with Hazelnuts"]
```

```
badDishes;
["Truffel Salt Burrito", "Vegan Philly Style Cheese Steak", "Split Pea Pizza with Cherry Tomatoes and Chocolate Shavings", "Parmesan Toast with Green Onions and Thyme", "Gazpacho with Lime and Potato Sauce", "Smoked Gouda and Poppy Seed Crackers", "Margherita Pizza with Mushrooms and Canteloupe", "Orange Glazed Vegan Chicken Cutlet", "Jelly Bean Ice Cream"]
```

### Submission
Submit the `index.html` file that contains the JavaScript code you wrote to solve this exercise.
