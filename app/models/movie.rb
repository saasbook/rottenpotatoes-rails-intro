class Movie < ActiveRecord::Base
    
    def self.all_ratings
    return ['G', 'PG','PG-13', 'R']
    end
end
