# When done, submit this entire file to the autograder.

# Part 1

def sum arr

    #first attempt
    #result = 0
    #arr.each { |a| result += a}
    #return result

    arr.reduce(0, :+)
    
end

def max_2_sum arr

    #x=0
    #arr.sort
    #x = sum(arr.last(2))
    #return x
    
    arr.sort.last(2).reduce(0, :+)
    
end

def sum_to_n? arr, n

  arr.combination(2).to_a.any? {|a| a[0] + a[1] == n}
  
end

# Part 2

def hello(name)

  'Hello, ' + name
  
end

def starts_with_consonant? s
    
  s[0..0].downcase =~ /[bcdfghjklmnpqrstvxz]/

end

def binary_multiple_of_4? s

    if (/^[0-1]+$/.match(s)).nil?
        return false
  
    s.to_i(2) % 4 == 0
       
    end

	end




# Part 3

class BookInStock

attr_accessor :isbn
    attr_accessor :price
    def initialize(isbn, price)
        raise ArgumentError if isbn.length == 0 || price <= 0
        @isbn = isbn
        @price = price
    end
    def price_as_string
        return "$#{ '%.02f' % @price }"
    end
end
