## Part 0 (A): Preparation: get RottenPotatoes running locally


 The actual RottenPotatoes starter app you will use is in another public repo: [saasbook/rottenpotatoes-rails-intro](https://github.com/saasbook/rottenpotatoes-rails-intro). Fork that repo to your own GitHub account, and then
 clone your fork:

 ```sh
 $ git clone git@github.com:[your_github_username]/rottenpotatoes-rails-intro.git
 ```

Whenever you start working on a Rails project, the first thing you should do is to run Bundler, to make sure all the app's gems are installed.  Switch to the app's root directory (presumably `rottenpotatoes-rails-intro`) and run `bundle install --without production` (you only need to specify `--without production` the first time, as this setting will be remembered on future runs of Bundler for this project).

Finally, get the local database created:

```sh
$ bin/rake db:setup # db:setup runs both db:create then db:migrate.
```

<details>
  <summary><strong>Self Check Question:</strong> How does Rails decide where and how to create the development database? (Hint: check the <code>db</code> and <code>config</code> subdirectories)</summary>
  <p><blockquote>The <code>rake db:migrate</code> command creates a local development database (following the specifications in <code>config/database.yml</code>) and runs the migrations in <code>db/migrate</code> to create the app's schema.  It also creates/updates the file <code>db/schema.rb</code> to reflect the latest database schema.  <strong>Note: it's important to keep this file under version control.</strong> </blockquote></p>
</details>
<br />

<details>
  <summary><strong>Self Check Question:</strong> What tables got created by the migrations?</summary>
  <p><blockquote>The <code>movies</code> table itself and the rails-internal <code>schema_migrations</code> table that records which migrations have been run.</blockquote></p>
</details>
<br />

Now insert "seed data" into the database. (_Seeds_ are initial data items that the app needs to run):

```sh
$ bin/rake db:seed
```

<details>
  <summary><strong>Self Check Question:</strong> What seed data was inserted and where was it specified? (Hint: <code>rake -T db:seed</code> explains the seed task; <code>rake -T</code> explains other available Rake tasks)</summary>
  <p><blockquote>A set of movie data which is specified in <code>db/seeds.rb</code></blockquote></p>
</details>
<br />

At this point you should be able to run the app locally (`rails server`) and navigating to `http://localhost:3000/movies` in your browser.

_Note:_ We have used both `bin/rails` and `rails`. Running "plain" `rail` and `rake` commands will be exactly the same in 99% of cases, but if you have an issue, try using `bin/` which guarantees you are using the right versions.

Next: [Part 0 (B): Preparation: deploy to Heroku](part_0_B.md)
