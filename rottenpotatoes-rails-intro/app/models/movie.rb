class Movie < ActiveRecord::Base
     
    
    def self.ratings
      ['G','PG','PG-13','R'] 
     end
end
