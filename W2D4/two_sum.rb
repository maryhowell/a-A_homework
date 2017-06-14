# time complexity: O(n^2)
# space complexity: O(1)

def bad_two_sum?(arr, target_sum)
  (0...arr.length-1).each do |idx1|
    (idx1+1...arr.length). each do |idx2|
      return true if arr[idx1] + arr[idx2] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!
  result = []

  arr.each_with_index do |el, index|
    other_num = (arr[0...index] + arr[index+1..-1]).bsearch { |x| target_sum - el - x }
    result << other_num if !other_num.nil?
  end
  !result.empty?
end

# indexing in hash map is constant time, so this is O(n), since it iterates once thru the array

def two_sum?(arr, target_sum)
  my_hash = Hash.new
  arr.each do |el|
    return true if my_hash[target_sum - el]
    my_hash[el] = "hello, I'm useless but at least not nil"
  end
  false
end


arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false
