list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
list2 = [5, 3, -7]
list3 = [-5, -1, -3]

# phase I
def my_min(arr)
  (0...arr.length-1).each do |idx1|
    (idx1+1...arr.length).each do |idx2|
      if arr[idx1] > arr[idx2]
        arr[idx1], arr[idx2] = arr[idx2], arr[idx1]
      end
    end
  end
  arr.first
end

# phase II

def smarter_my_min(arr)
  minimum = arr.first
  arr.each do |el|
    minimum = el if el < minimum
  end
  minimum
end

# phase 1
def largest_contiguous_subsum(arr)
  subarrays = []
  sums = []

  (0...arr.length-1).each do |index1|
    (index1...arr.length).each do |index2|
      subarrays << arr[index1..index2]
    end
  end

  subarrays.each do |subarray|
    sum = subarray.reduce(:+)
    sums << sum
  end
  sums.max
end


# STUDY - tricky solution!!!

def smarter_largest_contiguous_subsum(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |el| el < 0 }

  arr[1...arr.length].each do |num|
    # if the running tally in current is negative, reset it to 0
    current < 0 ? 0 : current
    # if current is reset to 0, new current becomes num. If current is not reset, add num to it.
    current = current + num

    # compare the running tally with the largest number. If running tally is larger, replace largest.
    if current > largest
      largest = current
    end
  end
  largest
end

p my_min(list)
p smarter_my_min(list)
p largest_contiguous_subsum(list2)
p largest_contiguous_subsum(list3)
p smarter_largest_contiguous_subsum(list2)
p smarter_largest_contiguous_subsum(list3)
