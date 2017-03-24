#=begin
require 'spec_helper'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

describe 'some stuff which requires js', :js => true do
  it 'will take a screenshot' do
    visit("http://agileventures.org")
    page.driver.render('./file.png', :full => true)
  end
end
#=end