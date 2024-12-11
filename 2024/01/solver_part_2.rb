class SolverPart2
  private attr_reader :left, :right

  def initialize(file:)
    process_input(file:)
  end

  def solve(log_result: true, log_details: false)
    summarized_similarity = 0
    left.each do |this_left|
      amount = right.count(this_left)

      similarity = this_left * amount
      summarized_similarity += similarity

      pp "left: #{this_left}, amount: #{amount}, similarity: #{similarity}, summarized_similarity: #{summarized_similarity}" if log_details
    end
    pp("summarized_similarity: #{summarized_similarity}") if log_result
    summarized_similarity
  end

  private

  def process_input(file:)
    input = File.read(file).split("\n").map { |line| line.split(/\s+/).compact.map(&:to_i) }
    @left = input.map { |line| line[0] }.sort
    @right = input.map { |line| line[1] }.sort
  end
end
