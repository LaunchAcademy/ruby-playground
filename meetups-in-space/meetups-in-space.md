When we noticed that [Meetup.com][meetup] didn't allow users to create meetups that take place in space, we knew we had our new business plan. Our goal is to disrupt the meetup space and bring synergy to meetup groups and their members throughout the entire universe. Why limit our market to just Earth?

### Learning Objectives

* Effectively structure data to minimize duplication.
* Model connections between information using one-to-many and many-to-many relationships.

### Instructions

Build a website similar to [Meetup.com][meetup] that allows users to sign up, join existing meetings, and even create their own meetup.

The application should satisfy the following user stories:

```no-highlight
As a user
I want to view the details of a meetup
So that I can learn more about its purpose
```

Acceptance Criteria:

* I should see the name of the meetup.
* I should see a description of the meetup.
* I should see where the meetup is located.

```no-highlight
As a user
I want to view a list of all available meetups
So that I can get together with people with similar interests
```

Acceptance Criteria:

* Meetups should be listed alphabetically.
* Each meetup listed should link me to the show page for that meetup.

```no-highlight
As a user
I want to create a meetup
So that I can gather a group of people to discuss a given topic
```

Acceptance Criteria:

* I must be signed in.
* I must supply a name.
* I must supply a location.
* I must supply a description.
* I should be brought to the details page for the meetup after I create it.
* I should see a message that lets me know that I have created a meetup successfully.

```no-highlight
As a user
I want to join a meetup
So that I can talk to other members of the meetup
```

Acceptance Criteria:

* I must be signed in.
* From a meetups detail page, I should click a button to join the meetup.
* I should see a message that tells let's me know when I have successfully joined a meetup.

For an **additional** challenge, implement the following user stories:

```no-highlight
As a user
I want to see who has already joined a meetup
So that I can see if any of my friends have joined
```

Acceptance Criteria:

* On the details page for a meetup, I should see a list of the members that have already joined.
* I should see each member's avatar.
* I should see each member's username.

```no-highlight
As a user
I want to leave a meetup
So that I'm no longer listed as a member of the meetup
```

Acceptance Criteria:

* I must be authenticated.
* I must have already joined the meetup.
* I see a message that lets me know I left the meetup successfully.

```no-highlight
As a user
I want to leave comments on a meetup
So that I can communicate with other members of the group
```

Acceptance Criteria:

* I must be authenticated.
* I must have already joined the meetup.
* I can optionally provide a title for my comment.
* I must provide the body of my comment.
* I should see my comment listed on the meetup show page.
* Comments should be listed most recent first.

#### User Authentication

The authentication system has already been implemented using the OAuth standard with GitHub's authentication service. You'll need to register your development app with GitHub and provide your own application keys using the following instructions:

1. Go to your [application settings page][github-app-settings] on GitHub and register a new application (the name of the application doesn't matter).
2. Set your "Homepage URL" to `http://localhost:4567/`.
3. Set your "Authorization Callback URL" to `http://localhost:4567/auth/github/callback`.
4. In the `.env` file fill in the values for `GITHUB_KEY` and `GITHUB_SECRET` that are provided on the GitHub settings page for your application.

#### Setting Up the Database

If you look in `config/database.yml` you can find the details of how to connect to your PostgreSQL database. In `db/migrate` you'll see that there is a migration that has already been written to create the `users` table.

Run the following commands to create and migrate your database:

```no-highlight
# Install all the dependencies for the app
$ bundle install

# Create the database
$ rake db:create

# Run all the migrations to get our schema up to date
$ rake db:migrate

# Start the application
$ ruby app.rb
```

At this point you can visit [http://localhost:4567][localhost] to view the application.

### Tips

1. **Before you start writing any code**, take some time to think about what your database should look like and draw an ER diagram.
2. Work on completing one user story at a time.
3. You will need to use a [has_many :through association][has-many-through].

### Resources

* [Active Record Query Interface][active-record-query-interface]
* [Active Record Associations][active-record-associations]

[github-app-settings]: https://github.com/settings/applications
[meetup]: http://www.meetup.com/
[active-record-query-interface]: http://guides.rubyonrails.org/active_record_querying.html
[active-record-associations]: http://guides.rubyonrails.org/association_basics.html
[has-many-through]: http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association
[localhost]: http://localhost:4567
