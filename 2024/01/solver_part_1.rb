class SolverPart1
  private attr_reader :left, :right

  def initialize(file:)
    process_input(file:)
  end

  def solve(log_result: true, log_details: false)
    summarized_distance = 0
    (0..left.length - 1).each do |index|
      this_left = left[index]
      this_right = right[index]
      set = [this_left, this_right]
      max = set.max
      min = set.min

      distance = max -min
      summarized_distance += distance

      pp("left: #{this_left}, right: #{this_right}, distance: #{distance}, summarized_distance: #{summarized_distance}") if log_details
    end
    pp("summarized_distance: #{summarized_distance}") if log_result
    summarized_distance
  end

  private

  def process_input(file:)
    input = File.read(file).split("\n").map { |line| line.split(/\s+/).compact.map(&:to_i) }
    @left = input.map { |line| line[0] }.sort
    @right = input.map { |line| line[1] }.sort
  end
end
