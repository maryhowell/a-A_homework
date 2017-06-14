def first_anagram?(str1, str2)
# store all possible anagrams and check if second string is one of those.
# O(n!) length of string 1
  possible_anagrams = str1.chars.permutation.to_a
  possible_anagrams.include?(str2.chars)

end

def second_anagram?(str1, str2)
# iterate over both strings.  As letters apear in both words delete one at a time
# strings are empty at the end
# O(n^2) of string 1

  str1 = str1.chars
  str2 = str2.chars
  dup1 = str1.dup

  dup1.each do |letter|
    if str2.include?(letter)
      str2.delete_at(str2.index(letter))
      str1.delete_at(str1.index(letter))
    end
  end
  str1.empty? && str2.empty?
end

# time complexity: O(n log n)
# space complexity: O(n)
def third_anagram?(str1, str2)
  alphabet = ("a".."z").to_a
  str1 = str1.chars.sort_by { |letter| alphabet.index(letter) }
  str2 = str2.chars.sort_by { |letter| alphabet.index(letter) }

  str1.sort! == str2.sort!
end

# O(n)
def fourth_anagram?(str1, str2)
  counter1 = Hash.new(0)
  counter2 = Hash.new(0)
  str1.each_char do |letter|
    counter1[letter] += 1
  end
  str2.each_char do |letter|
    counter2[letter] += 1
  end

  counter1 == counter2
end

# Time complexity: O(n)
# Space complexity: O(n)
def fifth_anagram?(str1, str2)
  counter_hash = Hash.new(0)
  str1.each_char do |letter|
    counter_hash[letter] += 1
  end
  str2.each_char do |letter|
    counter_hash[letter] += 1
  end

  return false if str1.length != str2.length

  str1.chars.all? do |letter|
    str1.count(letter) == (counter_hash[letter] / 2)
  end

end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")
p fifth_anagram?("gizmo", "sally")    #=> false
p fifth_anagram?("elvis", "lives")
p fifth_anagram?("cat", "cats") # false
