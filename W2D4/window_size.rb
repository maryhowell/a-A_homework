
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el

  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @maxes = []
    @mins = []
  end

  def pop
    value = @store.pop
    if value
  end

  def push(el)
    @store << el
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def max
    @maxes << @store1.max unless @store1.empty?
    @maxes << @store2.max unless @store2.empty?
    @maxes.max
  end

  def min
    @mins << @store1.min unless @store1.empty?
    @mins << @store2.min unless @store2.empty?
    @mins.min
  end


end

class StackQueue
  def initialize
    @store1 = MyStack.new
    @store2 = MyStack.new
  end

  def enqueue(el)
    @store1.push(el)
  end

  def dequeue
    if @store2.empty?
      until @store1.empty?
        @store2.push(@store1.pop)
      end
      @store2.pop
    else
      until @store2.empty?
        @store1.push(@store2.pop)
      end
      @store1.pop
    end
  end

  def size
    if @store1.empty?
      @store2.length
    else
      @store1.length
    end
  end

  def empty?
    @store1.empty? && @store2.empty?
  end

end

# windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
