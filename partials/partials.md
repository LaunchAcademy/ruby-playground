We are doing a refactor of a Video Rental website. After looking over their code, we can see that there are many places we DRY up the views.

### Goal

Make use of Rails partials in order to improve the code quality of the Movie Shack Hut web app.

### Instructions

```no-highlight
et get partials
cd partials
bundle
rake db:create
rake db:migrate
rake db:seed
rails server
open http://localhost:3000
```

Browse the website, then take a look at the views folder. Find and refactor the view code into [partials](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials).
