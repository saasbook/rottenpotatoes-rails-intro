class Movie < ActiveRecord::Base
   def self.curr_ratings
    ['G', 'PG', 'PG-13', 'R']
  end
end
