module FunWithStrings
  def palindrome? s
    if s.downcase = s.downcase.reverse
        return true
  end
  def count_words
  
  scan=string.scan(/[a-z]+/) 
  count={}
  scan.each do |x| 
    if count.has_key?x then 
      count[x]=count[x]+1
    else 
      count[x]=1
    end
  end
  count
  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
