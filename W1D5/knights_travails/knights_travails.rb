class KnightPathFinder

  attr_accessor :visited_positions

  def initialize(root)
    @start_pos = root
    @visited_positions = []

  end

  # def move_tree(pos)
  #     @value = pos
  # end
  def valid_moves?(pos)
    pos.all? { |val| val.between?(0, 7) }
  end

  def new_move_positions(pos)
    if valid_moves?(pos) == true
      visited_positions << pos unless visited_positions.include?(pos)
    end

  end

  def build_move_tree
    queue = [@start_pos]
    until queue.empty?
      @start_pos =
      return @start_pos if @start_pos == @end_position

  end

end

# kpf = KnightPathFinder.new([0, 0])
# kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
# kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
