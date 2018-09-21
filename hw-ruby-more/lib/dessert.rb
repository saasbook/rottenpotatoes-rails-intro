class Dessert
    
    #creates both getter and setter method
    attr_accessor :name, :calories

 
  def initialize(name, calories)
     @name= name
     @calories= calories
  end
  
  def healthy?
    @calories<200
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(flavor)
   
    @calories = 5
    @flavor = flavor
    @name = @flavor + " jelly bean"
  end

  def delicious?
    @flavor != "licorice"
        
    end
end

