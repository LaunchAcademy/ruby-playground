Being the movie buffs that we are, we need a database to store the  massive collection of movie data cataloged in our brains! Let's do this!

#### Step 1

Create the database.

```no-highlight
$ createdb movie_brain
```

Create a file to store the schema. All `CREATE TABLE`, `ALTER TABLE`, and `DROP TABLE` statements should go in this file.

```no-highlight
$ touch schema.sql
```

Edit the `schema.sql` file so that we can create the schema for the `movies` table. It should store the `id`, `title`, `year`, and `category` of each movie.

Once you have defined the schema for our `movies` table, run the SQL file against the database.

```no-highlight
$ psql movie_brain < schema.sql
```

#### Step 2

What good is a movie database without any movies? Create a file to add movies to our database. All `INSERT` statements should go in this file.

```no-highlight
$ touch data.sql
```

Now, write the necessary SQL statements in `data.sql` to insert at least three movies into the database. Make sure to have at least one movie from before the year 2000, and at least one after the year 2000. Run the SQL file against the database.

```no-highlight
$ psql movie_brain < data.sql
```

#### Step 3

Let's create a field to record all of our queries called `queries.sql`. All your `SELECT` statements should go in this file.
```no-highlight
$ touch queries.sql
```

Open up the `psql` console. Write a SQL statement that selects all of the movies before the year 2000. Store this and all future queries in `queries.sql`.

#### Step 4

Normalize the categories column by extracting it out into its own table. Modify the `schema.sql` file to add this new table.

**Note:** Instead of having to drop the database every time, add a `DROP TABLE movies CASCADE;` statement at the top of the file. That way, you can refresh the schema without an issue.

```no-highlight
$ psql movie_brain < schema.sql
```

#### Step 5

Add the following categories to the database:

* Action
* Comedy
* Drama
* Horror
* Sci-Fi

Feel free to add more categories if you wish.

**Note:** It may be helpful to comment out the insertions to the `movies` table for the moment.

#### Step 6

Write a query to view all categories and add it to the `queries.sql` file. Also, Fix the insertions to the `movies` table so that they use the correct `category_id` for each movie.

#### Step 7
Run `psql movie_brain < data.sql` at least twice.

We have a problem. We have multiple records for the same category names! Solve this problem by creating an index for uniqueness in your `schema.sql` file. Then, reload your schema and data and check that duplicate records are not created.

#### Step 8

Movie titles are not unique. However, the combination of the release year and title is generally unique. Create a schema constraint to reflect this.

Test that duplicate records are not created in the `movies` table.

#### Step 9

Add at least 5 more movies to your database.

Write a SQL query to get the movie with `id` of 4.

#### Step 10

Write a SQL query to order movie titles by year in ascending order. Then modify the SQL query to print out all movies in alphabetical order, grouped by year.

#### Step 11

Write a SQL query to print out the first five movies in the database. Then modify the SQL query to print out the last five movies released.

#### Step 12

Change the `Sci-Fi` category name to `Science Fiction`.

**Hint:** Use an `UPDATE`.

#### Step 13

Delete the movie with `id` of 3.

#### Step 14

Print out a list of movie titles, their corresponding category, ordered by the title of the movie.
