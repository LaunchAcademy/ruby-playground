Most actors in Hollywood know that they've "made it" when they are cast in a movie starring [Mark Robert Michael Wahlberg][mark-wikipedia], also known as **Marky Mark**. For those that haven't reached that pinnacle yet, the **Wahlberg Number** describes how many degrees of separation exist between that actor and Marky Mark.

To find how many movies separate a given actor from Hollywood royalty, we can model actors and the movies they starred in using a [graph data structure][graph-data-structure]. If we treat the nodes as actors and the links as the movies that two actors were cast in together, we can use existing algorithms (e.g. [Dijkstra's Algorithm][dijkstras-algorithm] or [A* Search][a-star-algorithm]) to find the shortest path between two actors within the graph.

### Learning Goals

* Read data in one format and convert it to a different data structure.
* Implement an algorithm in Ruby.

### Instructions

Write a program to list the movies separating a given actor from Mark Wahlberg. Each line should list a single link in the chain, alternately printing the actor and then the movie linking the actor above and below. If there is no connection between the actor and Marky Mark, print `"This actor has no relation to the Funky Bunch."`.

Three data files are provided in CSV format: `cast_members.csv`, `movies.csv`, and `actors.csv`. The `cast_members.csv` contains actors and the movies that they were cast in. The file uses numeric IDs rather than strings to represent actors and movies to save space. The `movies.csv` and `actors.csv` files can be used to resolve the movie and actor IDs, respectively.

The actor to link should be passed on the command line. To ensure that the actor's name is treated as a single argument even if there are spaces, wrap it in quotes:

```no-highlight
$ ./marky-mark.rb "Jack Nicholson"
```

If the supplied actor does not exist in the `actors.csv` file, print `"Can't find #{actor}, quitting."`.

### Sample Usage

```no-highlight
$ ./marky-mark.rb "Pauly Shore"
Actor: Mark Wahlberg
Movie: Max Payne
Actor: Ludacris
Movie: The Wash
Actor: Pauly Shore

$ ./marky-mark.rb "Katharine Hepburn"
Actor: Mark Wahlberg
Movie: Boogie Nights
Actor: Heather Graham
Movie: Drugstore Cowboy
Actor: Beah Richards
Movie: Guess Who's Coming to Dinner
Actor: Katharine Hepburn

$ ./marky-mark.rb "Frank Sinatra"
Actor: Mark Wahlberg
Movie: I Heart Huckabees
Actor: Jason Schwartzman
Movie: Bewitched
Actor: Shirley MacLaine
Movie: Ocean's Eleven
Actor: Frank Sinatra

$ ./marky-mark.rb "Tommy Wiseau"
This actor has no relation to the Funky Bunch.

$ ./marky-mark.rb "Barry Zuckerkorn"
Can't find Barry Zuckerkorn, quitting.
```

### Tips

* Before you start manipulating the data in the CSV files, study the algorithm you plan to use. What information does the algorithm require? What format would be most convenient to access this information?
* Rather than storing the actor and movie names as strings, consider using the integer IDs. Integers are fast to compare and (usually) take up less space than strings so it might be more efficient, especially when dealing with large amounts of data. When printing the actors or movies, the IDs can be resolved to the actual actor or movie names.

[mark-wikipedia]: http://en.wikipedia.org/wiki/Mark_Wahlberg
[graph-data-structure]: http://en.wikipedia.org/wiki/Graph_(mathematics)
[dijkstras-algorithm]: http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
[a-star-algorithm]: http://en.wikipedia.org/wiki/A*_search_algorithm
