## Part 2: Filter the list of movies by rating (15 points)

Enhance RottenPotatoes as follows. At the top of the All Movies listing, add some checkboxes that allow the user to filter the list to show only movies with certain MPAA ratings:

![](https://github.com/saasbook/hw-rails-intro/blob/master/filter-screenshot.png)

When the Refresh button is pressed, the list of movies is redisplayed showing only those movies whose ratings were checked.

This will require a couple of pieces of code. We have provided the code that generates the checkboxes form, which you can include in the index.html.haml template:

```haml
= form_tag movies_path, :method => :get do
  Include:
  - @all_ratings.each do |rating|
    = rating
    = check_box_tag "ratings[#{rating}]"
  = submit_tag 'Refresh', :class => 'btn btn-primary'
```

BUT, you have to do a bit of work to use the above code: as you can see, it expects the variable `@all_ratings` to be an enumerable collection of all possible values of a movie rating, such as `['G','PG','PG-13','R']`. The controller method needs to set up this variable. And since the possible values of movie ratings are really the responsibility of the Movie model, it's best if the controller sets this variable by consulting the Model. Hence, you should create a class method of `Movie` that returns an appropriate value for this collection.

You will also need code that knows (i) how to figure out which boxes the user checked and (ii) how to restrict the database query based on that result.  

Regarding (i), try viewing the source of the movie listings with the checkbox form, and you'll see that the checkboxes have field names like `ratings[G]`, `ratings[PG]`, etc. This trick will cause Rails to aggregate the values into a single hash called `ratings`, whose keys will be the names of the checked boxes only, and whose values will be the value attribute of the checkbox (which is "1" by default, since we didn't specify another value when calling the `check_box_tag` helper). That is, if the user checks the **G** and **R** boxes, `params` will include as one if its values `:ratings=>{"G"=>"1", "R"=>"1"}`. Check out the `Hash` documentation for an easy way to grab just the keys of a hash, since we don't care about the values in this case (checkboxes that weren't checked don't appear in the `params` hash at all).

Regarding (ii), you'll probably end up replacing `Movie.all` in the
controller method.  Since most
interesting code should go in the model rather than exposing details
of the schema to the controller, consider defining a
class-level method in the model such as `Movie.with_ratings(ratings)`
that takes an array of ratings (e.g. `["r", "pg-13"]`) and returns an
ActiveRecord relation of movies whose rating matches
(case-insensitively) anything in that array.  To do its job, this
method can make use of `Movie.where`, which has various options to
help you restrict the database query.  **Hint:** read the
[documentation](https://api.rubyonrails.org/v4.2) about
`ActiveRecord::Base` (on the docs page, click the flippy triangle next
to the class name `ActiveRecord` and find the interior class `Base`)
for examples of how to use `where` to do queries like this.

### IMPORTANT for grading purposes

* Your form tag should have the id `ratings_form`.
* The form submit button for filtering by ratings should have an HTML
element id of `ratings_submit`
* Each checkbox should have an HTML element id of `ratings_#{rating}`,
where the interpolated rating should be the rating itself, such as
`ratings_PG-13`, `ratings_G`, and so on.

### Hints and caveats

Make sure that you don't break the sorted-column functionality you added previously! That is, sorting by column headers should still work, and if the user then clicks the "Movie Title" column header to sort by movie title, the displayed results should be sorted but do not need to be limited by the checked ratings (we'll get to that in part 3).

If the user checks (say) **G** and **PG** and then redisplays the list, the checkboxes that were used to filter the output should appear checked when the list is redisplayed. This will require you to modify the checkbox form slightly from the version we provided above.

The first time the user visits the page, all checkboxes should be checked by default (so the user will see all movies). For now, ignore the case when the user unchecks all checkboxes--you will get to this in the next part.

Reminder: Don't put code in your views! Set up an instance variable in the controller that remembers which ratings were actually used to do the filtering, and make that variable available to the view so that the appropriate boxes can be pre-checked when the index view is reloaded.

You'll submit this part after you deploy on Heroku and when you supply your Heroku deployment URL in part 3.  But you can commit all the changes you have made so far to git, deploy them to Heroku and check that they work on Heroku before moving on to the next section:

```sh
$ git commit -am "part 2 complete"
$ git push heroku master
```

Next: [Part 3: Remember the sorting and filtering settings](part_3.md)
