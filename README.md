# RottenPotatoes demo app: getting started

This app is associated with the free [online
course](http://www.saas-class.org) and (non-free)
[ebook](http://www.saasbook.info) Engineering Software as a Service.

To get started:

0. [Setup a Cloud9
environment](https://github.com/saasbook/courseware/wiki/Setting-up-Cloud9)
for the course.

0. Fork this repository to your own GitHub account, using the "Fork"
button in the upper right corner of this page.  It's fine to make the
forked copy public.

0. In your Cloud9 terminal, type the following command to clone your
copy of the repository to your development workspace:

`git clone git@github.com:YourGithubUsername/rottenpotatoes-rails-intro.git`

0. Then `cd rottenpotatoes-rails-intro` to change to the app's
directory.

0. Run the command `bundle install --without production` to make sure all the gems
(libraries) used by the app are in place.

0. Run `bundle exec rake db:setup` to create the initial database.

0. Run `rails server -p $PORT -b $IP` to start the app.  Cloud9 will pop
up a window showing the URL to visit in your browser to interact with
the running app.
