# Outline

### Learning Goals

* Implement a function using JavaScript
* Compare and contrast return values vs. functional side effects
* Define and clarify the concept of scope
* Understand variable hoisting and the `this` keyword

## What is a JavaScript function?

The language's built-in functions likely are familiar to you. Take `alert()`, for example. If you run `alert('Hey, you')` from your console, you will see a small alert pop-up with the text `Hey, you` on the screen. While JavaScript's built-in functions are valuable, as programmers we want to be able to write our own functions for our specific needs. Functions let us do just that.

Functions are *central* to the JavaScript programming language.

#### JavaScript Function Definition

Here we can set the variable `triple` to a function that returns three times an input:

```javascript
var triple = function(x) {
  return 3 * x;
};
```

```no-highlight
> triple(6);
18
```

Functions begin with a keyword `function`. `x` here is considered a *parameter* and `return 3 * x;` is the *body*, which needs to be wrapped in curly braces. Functions can also have no parameters. Here's an example:

```javascript
var gimmeThree = function() {
  return 3;
};
```

When we call `gimmeThree()` in our console, we see that it returns the number `3`.

```no-highlight
> gimmeThree();
3
```

Let's look at a slightly more complex example of calculating the factorial of a number `x`:

```javascript
var factorial = function(x) {
  var product = 1;
  for (var count = x; count > 0; count--) {
    product = product * count;
  }
  return product;
};
```

```no-highlight
> factorial(4);
24
```

#### Passing Functions as Parameters of Other Functions

A really powerful aspect of the language that JavaScript provides for is the ability to pass functions as parameters to other functions:

```javascript
var obiWanKenobi = function (name) {
  return "Use the force, " + name;
}

var darthVader = function (name) {
  return name + ", I am your father.";
}
```

Here we are just defining two functions `obWanKenobi` and `darthVader` which return two different strings based on an input `name`. We can now pass either of those functions to another function `dataHandler`:

```javascript
var dataHandler = function (name, func) {
  return func(name);
}
```

Now let's call `dataHandler` by passing two parameters to it:

```
dataHandler("Luke", obiWanKenobi);
>> "Use the force, Luke"

dataHandler("Luke", darthVader)
>> "Luke, I am your father."
```

Passing functions around not only cleans up our code, but allows us to organize and associate powerful actions especially when we incorporate events.

#### Side Effects

One thing in common of each of the above functions is that they all *return* a value. Not all functions return a value. Some produce *side effects*. Consider the following function:

```javascript
var sayHiYou = function() {
  console.log("Hi, You!");
};
```

```no-highlight
> sayHiYou();
Hi, You!
```

While it looks like this function *returns* a string "Hi, You!", it's actually producing a side effect of printing to the screen.

Say we had both a `console.log` line in the function along with returning the same string "Hi, You!".

```javascript
var sayHiYou = function() {
  console.log("Hi, You!");
  return("Hi, You!");
};
```

```no-highlight
> sayHiYou();
Hi, You!
"Hi, You!"
```

In the above example, the function `SayHiYou` both logs to the console along with returning the string. The return value is in quotes because it is a `String` data type.

The term *side effect* has a negative connotation to it, but that doesn't have to be the case in programming! You can probably guess there are times when you *want* to produce side effects (like printing to the screen, for example). There are *pure* functions, too. These functions have the sole purpose of returning a value with no side effects, but also doesn't have any side effect dependencies.

Something to note here is the following: There are *pure functions* in JavaScript, which neither depend on nor modify the states of variables outside their scopes. We can also say that a *pure function* will return a consistent result given the same arguments. Here is an *impure* function and a *pure* function:

(1) Impure Function

```javascript
var thinkerPerson = { name: "Wittgenstein" };

function impureFunction ( thing ) {
  var suffix = "Philosopher";

  thing.name = thing.name + ", " + suffix;
}

impureFunction( thinkerPerson )
```

(2) Pure Function

```javascript
var thinkerPerson = { name: "Wittgenstein" };

function pureFunction ( thing ) {
  var suffix = "Philosopher";

  thing = thing + ", " + suffix;

  return thing;
}

pureFunction ( thinkerPerson.name );
```

In example (1), `thinkerPerson` is modified by `impureFunction` while in example (2), it is not. `pureFunction` also neither depends nor modifies variables outside of its own scope. Let's talk a little more about scope now.

## Scope

We'll delve into *scope* very soon, but it's worth approaching multiple times from different angles as it can take a bit of time to grok. Variables in JavaScript have *scope*, meaning they can be *global* or *local* with respect to a function. Consider the following example:

```javascript
var thisSpaceThing = "is in space";

var spaceshipOne = function() {
  var thisSpaceThing = "is in a spaceship";
};
```

We have the variable `thisSpaceThing` twice. The first time, it's defined as `"is in space"` globally, and the second time it's defined as `"is in a spaceship"` within the function `spaceshipOne`. Let's see what this means when we run `spaceshipOne` and check the value of `thisSpaceThing`:

```no-highlight
> spaceshipOne();
> console.log(thisSpaceThing);
is in space
```

Here, `thisSpaceThing` is the global `thisSpaceThing` defined in the first line. The reason it doesn't change is because the second `thisSpaceThing` is defined as a variable within the function `spaceshipOne`. Can we change that value within another function? Let's take a look:

```javascript
var thisSpaceThing = "is in space";

var spaceshipTwo = function() {
  thisSpaceThing = "is in another spaceship";
};
```

Here we define `thisSpaceThing` is `"is in space"` once and we change that value in the function `spaceshipTwo`. That means when we call `spaceshipTwo`, `thisSpaceThing` will have a new value of `"is in another spaceship"`. Let's see this happen:

```no-highlight
> spaceshipTwo();
> console.log(thisSpaceThing);
is in another spaceship
```

Variable scope lets us protect our variables. We don't want functions changing the values of variables we care about. Often, in JavaScript, you'll see the same variable name used over and over again, but by maintaing a function-local scope, that never becomes an issue we butt heads up against.

Omitting the `var` keyword during variable assignment makes a variable have global scope. This is generally something we want to avoid, so prepending your variable with `var` limits the scope of a particular variable to its current scope.

## Interlude: Functions as First Class Objects

In JavaScript, functions are `first-class Objects`. That means that they are objects, and therefore, have all the properties of objects. What's so special about that? Well, while a program is being executed, a function that was constructed can be stored in a data structure. As a result, we can pass the function around as an argument to another function and even have that function be returned as the value of another function!

* Interested in learning more here? See more on [StackOverflow](http://stackoverflow.com/questions/705173/what-is-meant-by-first-class-object) and this [blog post](http://helephant.com/2008/08/19/functions-are-first-class-objects-in-javascript/) about functions as first class objects.

By the way, it's worth nothing here that to have a function return a value of something other than the default, a return statement must be called. Without a return statement, the function will return a default value, namely one of two types: (1) If the function constructor is called with *new*, the default value is the value of *this* (we'll talk more about *this* later); (2) Otherwise, *undefined* is returned. We'll get into *this* and *undefined* later on, but for now, just this keep in mind when constructing a function without an explicit return statement.

#### Scope and Object Properties

Let's take a look at how scope and a function's properties interrelate:

```javascript
function myFunction(theSpaceship) {
  theSpaceship.brand = "Virgin Galactic";
}

var mySpaceship = {
  brand: "SpaceX",
  model: "Enterprise",
  year: 2028
};
```

Here we define `myFunction` which takes an object and performs a task on it (setting the object's brand to `Virgin Galactic`). Let's take a look at a few things in `console.log` and see what's going on:

```no-highlight
> console.log(mySpaceship.brand)
"SpaceX"
```

That's straightforward. Let's pass mySpaceship to `myFunction` now and then look at the value of `mySpaceship.brand`:

```no-highlight
> myFunction(mySpaceship);
> mySpaceship.brand;
"Virgin Galactic"
```

So what happened? The function `myFunction` changed the value of the `brand` property of the `mySpaceship` object. Getting this concept down conceptually will help you tremendously in your JavaScript career. We say that `myFunction` provided a *side effect* when it changed the state of the supplied argument.

How can we use this in a real-life example? Let's write a function that takes mySpaceship and generates an HTML string of list elements. In practice, we can append that string on our page to render it on a website:

```javascript
function createList(thisSpaceship) {
  var htmlString = "";
  htmlString += "<ul>";
  htmlString += "<li>Brand:" + thisSpaceship.brand + "</li>";
  htmlString += "<li>Model:" + thisSpaceship.model + "</li>";
  htmlString += "<li>Year:" + thisSpaceship.year + "</li>";
  htmlString += "</ul>";

  return htmlString;
}
```

We're just grabbing each property of the `mySpaceship` object and appending them to a list. Let's call `createList` on `mySpaceship` and see what's returned:

```javascript
> createList(mySpaceship)
"<ul><li>Brand:SpaceX</li><li>Model:Enterprise</li><li>Year:2028</li></ul>"
```

Now we can call this `createList` on the object we care about to generate an HTML list that we'll append to a website to render that HTML. We'll do this kind of data manipulation all the time.

## Function declarations vs. expressions

Let's look at a few examples of functions. Each of these has it's own subtleties that we'll discuss in a moment.

(1) Function declaration:

```javascript
function addInSpace(string) {
  return string + "in Space";
};
```

(2) *Anonymous* function expression assigned to `stringInSpace`:

```javascript
var stringInSpace = function(string) {
  return string + "in Space";
};
```

(3) *Named* function `addInSpace` expression assigned to `stringInSpace`:

```javascript
var stringInSpace = function addInSpace(string) {
  return string + "in Space";
};
```

All these look pretty similar and they do the same thing (add the string `"in Space"` to another string), but there are some key differences:

* Function *declarations* load before code gets executed.
* Function *expressions* load when the JavaScript reaches that line of code.

#### A Short Interlude on Function Declarations vs. Expressions

One of the simplest ways to create a new JavaScript function is with a *function declaration*:

```javascript
function eatSpaceFood() {
  alert("You are an astronaut!");
}

eatSpaceFood();
```

The JavaScript interpreter creates a function object (in this case `eatSpaceFood()`) as it parses the JavaScript code, and before the code is run. That allows you, due to a peculiarity of JavaScript called *hoisting* (which we'll talk more about later), to call a function "before" it is declared:

```javascript
eatSpaceFood();

function eatSpaceFood() {
  alert("You are an astronaut!");
}
```

*Function expressions* also let us create functions:

```javascript
var eatSpaceFood = function() {
  alert("You are an astronaut!");
}

eatSpaceFood();
```

However, they have with one main difference with *function declarations*. Hoisting doesn't affect *function expressions* so they get evaluated as the code runs.

*When do we use one over the other?*

*Function declarations* look very similar to how functions and methods might look in other languages, but *function expressions* let us be very specific and about what kind of code we are trying to write. For example, *function declarations* shouldn't be be declared inside `if` statements or loops. In fact, different browsers will handle this kind of behavior differently. If you stick to *function expressions* broadly, you are likely to deal with less naming and scope issues long term.

## More on Global vs. Local Scope

### Global Scope

Defining a variable outside of a function will result it in having global scope. As a result, a global variable can be accessed by the browser at any point. How are global variables declared?

(1) Declaration outside of a function:

```javascript
var myFavoriteCity = "Berlin";
```

or

```javascript
favoriteCity = "Berlin";
```

(2) Declaration without the `var` keyword *in* a function

```javascript
function showFavoriteCity() {
  favoriteCity = "Berlin";
  return favoriteCity;
}
```

```
> showFavoriteCity();
"Berlin"
```

Now, let's call the variable `favoriteCity`:

```
> favoriteCity;
"Berlin"
```

Note that after we call `showFavoriteCity()`, `favoriteCity` has a global context. What if we use the `var` keyword?

```javascript
function showAnotherFavoriteCity() {
  var anotherFavoriteCity = "New York";
  return anotherFavoriteCity;
}
```

```no-highlight
> showAnotherFavoriteCity();
"New York"
```

What happens when we call `anotherFavoriteCity`?:

```no-highlight
> anotherFavoriteCity;

Uncaught ReferenceError: anotherFavoriteCity is not defined
    at <anonymous>:2:1
    at Object.InjectedScript._evaluateOn (<anonymous>:895:140)
    at Object.InjectedScript._evaluateAndWrap (<anonymous>:828:34)
    at Object.InjectedScript.evaluate (<anonymous>:694:21)
```

As mentioned before, the `var` keyword is what separates global from local scope in a function. Keeping track of these kinds of things will become more and more important over time.

Also, it's advisable that you avoid creating many globally scoped variables. If you can scope a variable locally and don't need to globally, it's worth doing as it makes debugging and application control much easier.

### Local Variables & Scope (Also known as function level scope)

Here is an example of local variable scope:

```javascript
var tibetanKing = "Nyatri Tsenpo"

function whoIsTheKingOfTibet() {
  var tibetanKing = "Langdarma"
  return tibetanKing;
}

console.log(tibetanKing);
```

Here, we have `tibetanKing` of `"Langdarma"` scoped to the function `whoIsTheKingOfTibet()` and `"Nyatri Tsenpo"` outside the scope of the function:

```no-highlight
> whoIsTheKingOfTibet();
"Langdarma"

> console.log(tibetanKing);
Nyatri Tsenpo
```

While both variables are called `tibetanKing`, they are not the same variable and have entirely different scopes. In fact, with respect to variables that have the same name, local variables take precedence over global variables when accessing a function that has the variable name used in its scope.

## Variable Hoisting

In JavaScript, variable declarations get processed before any other code gets processed. That implies that variables can look like they're used before they're declared:

```javascript
myPlanet = "Saturn";
var myPlanet;
```

is processed as the following:

```javascript
var myPlanet;
myPlanet = "Saturn";
```

This behavior is called *hoisting*, where variables are *hoisted* to the top of their containing scope. Because of this, strange or unintended behavior can occur! This can be a frequent cause of logic errors in your JavaScript.

As an exercise to understand this, load up your browser console and take a look at each of the following examples and work through what hoisting is doing in each instance:

(1)

```javascript
var spaceThing = 'the Universe';
(function() {
  alert(spaceThing);
})();
```

(2)

```javascript
var spaceThing = 'the Universe';
(function() {
  alert(spaceThing);

  var spaceThing = 'Earth';
})();
```

(3)

```javascript
var spaceThing = 'the Universe';
(function() {
  var spaceThing = 'Earth';

  alert(spaceThing);
})();
```

(4)

```javascript
var spaceThing = 'the Universe';
(function() {
  var spaceThing;

  alert(spaceThing);

  var spaceThing = 'Earth';
})();
```

Note: These kinds of functions are called *Self-Invoking Functions*:

```javascript
(function() {
  # code
})();
```

Self-invoked functions automatically execute versus *function declarations* or *function expressions* which need to get called.

So what's going on? Effectively this: in JavaScript, if your variable is declared *anywhere* in a scope, the *declaration* is hoisted to the top of the scope but *not* the *initialization*. As a rule, it's a good idea to define your variables at the top of a scope to avoid unintended behavior.

*Tip*: Always ensure your `var` keywords appear at the top of your scripts and functions.

## this

Think of the *this* keyword like a pronoun in English. The following two sentences effectively mean the same thing:

(1)

Hubble's orbit outside the distortion of Earth's atmosphere allows it to take extremely high-resolution images with negligible background light.

(2)

Hubble's orbit outside the distortion of Earth's atmosphere allows Hubble to take extremely high-resolution images with negligible background light.

<sub>Source: [Wikipedia](https://en.wikipedia.org/wiki/Hubble_Space_Telescope)</sub>

In the first sentence, `it` refers to Hubble. In English, this is short hand to avoid repeating `Hubble` again (like in sentence 2). It would be awkward to repeat `Hubble` when we can just use `it` as a reference. Similarly, *this* is a JavaScript keyword that refers to an object that is the subject of a current scope.

Let's see it in action.

A while back, we defined a `mySpaceship` object with three properties:

```javascript
var mySpaceship = {
  brand: "SpaceX",
  model: "Enterprise",
  year: 2028
};
```

Let's add a function called `details` to this object which logs the details of the `mySpaceship` variable:

```javascript
var mySpaceship = {
  brand: "SpaceX",
  model: "Enterprise",
  year: 2028,
  details: function() {
    var string = "Brand: " + mySpaceship.brand + ", ";
    string += "Model: " + mySpaceship.model + ", ";
    string += "Built in: " + mySpaceship.year;
    console.log(string);
  }
};
```

Now when we call `mySpaceship.details()` we see the following text in the console:

```
Brand: SpaceX, Model: Enterprise, Built in: 2028
```

Great. That does what we want, but it's a bit unwieldy. What if we had a global variable somewhere called `mySpaceship` that referenced a different spaceship? We can handle this imprecision and ambiguity with the `this` keyword:

```javascript
var mySpaceship = {
  brand: "SpaceX",
  model: "Enterprise",
  year: 2028,
  details: function() {
    var string = "Brand: " + this.brand + ", ";
    string += "Model: " + this.model + ", ";
    string += "Built in: " + this.year;
    console.log(string);
  }
};
```

`this` now refers to the context we're in when we call the `details()` function, meaning that `this` refers to the variable `mySpaceship` that the function gets called in. `this` is the entire object declared and assigned to `mySpaceship` above. Also, note that `this` only gets assigned when the function where `this` is declared gets invoked.

<sub>BTW, remember the DOM? Call `this` in your console and see what it refers to.</sub>

* More on this in the [Mozilla docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this) and at [JavaScript is sexy](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
