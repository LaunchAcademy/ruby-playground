# Student Grades

Your teachers are stuck in the dark ages and don't store their students' grades electronically anywhere.  Build a ruby program that'll let them store their students' grades for each assignment.

## Instructions

Your app should have three models:  A `Student` model, an `Assignment` model, and a `Grade` model that represents a particular student's grade on a particular assignment.

Before you begin coding, draw an ER diagram for your app.

### Assignment

Create an `Assignment` class.  It should contain the following methods:

* `name` returns the name of the assignment
* `due_date` returns the date the assignment is due
*  `grades` returns an array of all that assignment's `Grade` objects
* `average_grade` returns the average grade for that assignment
* `report` returns a summary listing out the assignment, each student's name and the grade they received on the assignment.  Students should be ordered alphabetically by first name:

  ```no-highlight
  Assignment: Git Quiz
  Due date: 10/24/2014
  Average Score: 94.4

  GRADES:

  Adam Sheehan, 100
  Eric Kelly, 84
  Helen Hood, 90
  Omid Bachari, 98
  Richard Beastmaster, 98
  Spencer Dixon, 96
  Vikram Ramakrishnan, 95
  ```

### Student

Create a `Student` class.  It should contain the following methods:

* `name` returns the student's name
* `grades` returns an array of all that student's grade objects
* `average_grade` returns the student's average grade for all of his/her assignments
* `report_card` returns a summary of all the assignments the student has completed, along with the due date and grade.  Grades should be sorted by due date:

  ```no-highlight
  Name: Richard Beastmaster
  Average Grade: 95.75

  Grades:

  Git Quiz (10/24/2014) - 98
  Rescue Mission (11/1/2014) - 100
  Meetups In Space (11/18/2014) - 87
  Slacker News (12/4/2014) - 98
  ```

### Grade

Create a `Grade` class that represents a given student's grade on a particular assignment.  It should contain the following methods:

* `student` returns the student whose grade it is (should return a `Student` object)
* `assignment` returns the assignment that the grade is for (should return an `Assignment` object)
* `score` returns the score the student received on that assignment

## Setup

Run the test suite and use the failing tests to guide your implementation:

```no-highlight
$ rspec spec
```
