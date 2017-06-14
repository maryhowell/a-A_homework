#remember!!
#MAKE A BASECASE!
#solve problem by reducing sub problems

def range(start, last)
  return [] if last < start
  range(start, last - 1) << last - 1
end

# p range(1,5)
# p range(0,1)

# iterative
def sum_itera(nums)
  sum = 0
  nums.each { |num| sum += num }
  sum
end

# p sum_itera(5)
# p sum_itera(0)

# recursive
def sum_recurse(num)
  return 0 if num == 0
  num[0] + sum_recurse(num.delete(1))
end
#
# p sum_recurse(5)
# p sum_recurse(0)

# Exponentiation

def exponent1(base, power)
  # if power equals zero , then 1 else (base * method(base,power - 1))
   if power == 0
     return 1
   else
     (base * exponent1(base, power - 1))
   end
end

# p exponent1(3,4)

def exponent2(base, power)
  # same as ^ above problem
  return 1 if power == 0
  half = exponent2(base, power / 2)
  if power.even?
    half * half
  else
    base * half * half
  end
end

# p exponent2(3,4)

class Array
  def deep_dup(array)
    return array if array.empty?
    new_array = []
     self.each do |element|
       new_array << (element.is_a?(Array) ? element.deep_dup : element)
     end
      new_array
  end
end

# p deep_dup([1, [2], [3, [4]]])

def iterative_fibbys(n)
  return [] if n == 0
  return [0] if n == 1

  fibs = [0, 1]
  while fibs.count < n
    fibs << fibs[-2] + fibs[-1]
  end
  fibs
end
# p iterative_fibbys(3)

def recursive_fibbys(n)
  if n <= 2
   [0, 1].take(n)
  else
   fibs = recursive_fibbys(n - 1)
   fibs << fibs[-2] + fibs[-1]
  end
end
# p recursive_fibbys(3)


class Array
  def array_sub
    return [[]] if empty?
    subs = take(count - 1).array_sub
    subs.concat(subs.map { |sub| sub + [last] })
  end
end

# p array_sub([]) # => [[]]
# p array_sub([1]) # => [[], [1]]
# array_sub([1, 2]) # => [[], [1], [2], [1, 2]]
# array_sub([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(array)
  return [array] if array.length <= 1
  start = array.shift
  perm = permutations(array)
  total_perms = []
  perm.each do |perms|
    (0..perm.length).each do |i|
      total_perms << perms[0...i] + [start] + perms[i..-1]
    end
  end
  total_perms
end

# p permutations([1, 2, 3])
# p permutations([2, 5])

def bsearch(array, target)
  # compare target value to middle element
  #if target value is == to middle elements value
    #return the position and end
  # if target value is less than middle value seach lower half of array
    # same goes for greater than (search upper half)
  # when it searches lower or upper half it keeps the same logic as the beginning
  # nil if not found; can't find anything in an empty array
  return nil if array.empty?

  index = array.length / 2
  # spaceship operator magic!
  case target <=> array[index]
  when -1 #search left side
    bsearch(array.take(index), target)
  when 0
    index
  when 1 #search right side
    answer = bsearch(array.drop(index + 1), target)
    answer.nil? ? nil : index + 1 + answer
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
  def merge_sort
      # run time is the worst out of all sort algorithms FYI
      # base case arrays of length 0 or 1
      # divied unsorted list in to n sublists (each with 1 el)


    return self if count < 2

    middle = count / 2
    left, right = self.take(middle), self.drop(middle)
    sorted_left, sorted_right = left.merge_sort, right.merge_sort
    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged = []
    until left.empty? || right.empty?
      merged << (left.first < right.first ? left.shift : right.shift)
    end
    merged + left + right
  end
end


# def make_change(target, coins = [25, 10, 5, 1])
#   # Don't need any coins to make 0 cents change
#   return [] if target == 0
#   # Can't make change if all the coins are too big. This is in case
#   # the coins are so weird that there isn't a 1 cent piece.
#   return nil if coins.none? { |coin| coin <= target }
#
#   # Optimization: make sure coins are always sorted descending in
#   # size. We'll see why later.
#   coins = coins.sort.reverse
#
#   best_change = nil
#   coins.each_with_index do |coin, index|
#     # can't use this coin, it's too big
#     next if coin > target
#
#     # use this coin
#     remainder = target - coin
#
#     # Find the best way to make change with the remainder (recursive
#     # call). Why `coins.drop(index)`? This is an optimization. Because
#     # we want to avoid double counting; imagine two ways to make
#     # change for 6 cents:
#     #   (1) first use a nickel, then a penny
#     #   (2) first use a penny, then a nickel
#     # To avoid double counting, we should require that we use *larger
#     # coins first*. This is what `coins.drop(index)` enforces; if we
#     # use a smaller coin, we can never go back to using larger coins
#     # later.
#     best_remainder = make_change(remainder, coins.drop(index))
#
#     # We may not be able to make the remaining amount of change (e.g.,
#     # if coins doesn't have a 1cent piece), in which case we shouldn't
#     # use this coin.
#     next if best_remainder.nil?
#
#     # Otherwise, the best way to make the change **using this coin**,
#     # is the best way to make the remainder, plus this one coin.
#     this_change = [coin] + best_remainder
#
#     # Is this better than anything we've seen so far?
#     if best_change.nil? || (this_change.count < best_change.count)
#       best_change = this_change
#     end
#   end
#
#   best_change
# end
