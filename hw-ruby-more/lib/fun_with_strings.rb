module FunWithStrings
  def palindrome? 
  #replace non alpha characters with spaces, lower to downcase
    s = gsub(/\W/, '').downcase
    s == s.reverse
    
  end
  def count_words
    
    #creates new hash
    wordsCount = Hash.new(0)
    #replaces all non alphabetic characters with spaces
    s = gsub(/[\W]/, ' ') 
    #makes string downcase, splits string to seperate words. Add each
    # word to their specific key
    s.downcase.split(' ').each do |word|
    wordsCount[word] += 1
  end
  return wordsCount
end
  end
  
  def anagram_groups
    s.each do |word|
    key = word.split('').sort.join
      result[key] << word 
    end
   end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
