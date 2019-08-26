## Part 1: Sort the list of movies (15 points)

On the list of all movies page, make the column headings for "Movie Title" and "Release Date" into clickable links. Clicking one of them should cause the list to be reloaded but sorted in ascending order on that column. For example, clicking the "release date" column heading should redisplay the list of movies with the earliest-released movies first; clicking the "title" header should list the movies alphabetically by title. (For movies whose names begin with non-letters, the sort order should match the behavior of `String#<=>`.)

When the listing page is redisplayed with sorting-on-a-column enabled, the column header that was selected for sorting should appear with a yellow-orange background, as shown below. The selected column header should also have 2 additional CSS classes added to it: 1) `hilite`, and 2) a utility class from the [Bootstrap Colors](https://getbootstrap.com/docs/4.0/utilities/colors/) set. You should do this by setting controller variables that are used to conditionally set the CSS class of the appropriate table heading to these new classes.

The result should look something like this:

![](https://github.com/saasbook/hw-rails-intro/blob/master/table-header-screenshot.png)

**IMPORTANT for grading purposes:**

The link (that is, the `<a>` tag) for sorting by "title" should have the HTML element id `title_header`, and the link for sorting by release date should have the HTML element id `release_date_header`.  The table containing the list of movies should have the HTML element id `movies` (this has already been set for you by the starter code).

### Hints and caveats:

* The current RottenPotatoes views use the Rails-provided "resource-based routes" helper `movies_path` to generate the correct URI for the movies index page. You may find it helpful to know that if you pass this helper method a hash of additional parameters, those parameters will be parsed by Rails and available in the `params[]` hash.  

* Databases are pretty good at returning collections of rows in sorted order according to one or more attributes. Before you rush to sort the collection returned from the database, look at the [documentation](http://api.rubyonrails.org/v4.2.6/) for `ActiveRecord.order` and see if you can get the database to do the work for you.

* Don't put code in your views! The view shouldn't have to sort the collection itself--its job is just to show stuff. The controller should spoon-feed the view exactly what is to be displayed.  

### Submission

You'll submit the code for this part after you deploy on Heroku and when you supply your Heroku deployment URL in part 3.

For now, commit all the changes you have made so far, and deploy them to check that they work on Heroku before moving on to the next section:

```sh
$ git commit -am "part 1 complete"
$ git push heroku master
```

Next: [Part 2: Filter the list of movies by rating](part_2.md)
