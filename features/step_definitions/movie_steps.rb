# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
end

=begin
Then /^show me the "([^"]*)" page$/ do |type|
  #save_and_open_page
  page.driver.render("./#{type}.png")
end
=end


When /^I confirm popup$/ do
  page.driver.render('./confirm.png')

  # requires poltergeist:
  using_wait_time 3 do
    page.driver.accept_modal(:confirm)
  end
end

When /^I confirm popup with message "([^"]*)"$/ do |modal_text|
  message = page.accept_confirm { click_button 'Delete' }
  expect(message).to eq modal_text
end

When /^I dismiss popup with message "([^"]*)"$/ do |modal_text|
  message = page.dismiss_confirm { click_button 'Delete' }
  expect(message).to eq modal_text
end

# Make sure that a string (rex) occurs before or after another on the same page
Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body).to match(/.*#{e1}.*#{e2}/m)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"
# As well as all of them
When /I (un)?check (the following|all of the) ratings:? ?(.*)/ do |uncheck, which, ratings_str|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  which.include?('all') ? ratings = Movie.all_ratings : ratings = ratings_str.split
  ratings.each do |rating|
    #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
    step %Q{I #{uncheck}check "ratings[#{rating}]"}
  end
end

Then /^I should (not )?see (the following|all of the) movies:? ?(.*)$/ do |negated, which, movies_str|
  which.include?('all') ? movies = Movie.all.map { |movie| movie.title } : movies = movies_str.split(/,\s*/)
  movies.each do |movie_title|
    step %Q{I should #{negated}see "More about #{movie_title}"} #assurance movie is found in title field
  end
end

Then /^I should (not )?see "([^"]*)" in the list of movies$/ do |negated, movie_title|
  text = page.body
  header = text.slice!(/.*All Movies/m)
  #p 'HEADER' + header
  #p 'TEXT' + text
  if negated
    expect(text).not_to match(/.*#{movie_title}.*/m)
  else
    expect(text).to match(/.*#{movie_title}.*/m)
  end
  #step %Q{I should #{negated}see "#{movie_title}"}
end

