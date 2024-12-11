require_relative 'solver_part_1'

class SolverPart2 < SolverPart1
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
end
