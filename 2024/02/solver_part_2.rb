require_relative 'solver_part_1'

class SolverPart2 < SolverPart1
  def solve
    amount_of_safe_reports = 0
    input.each do |line|
      is_save_report = save_report?(data: line)
      amount_of_safe_reports += 1 if is_save_report

      pp("is_save_report: #{is_save_report}, amount_of_safe_reports: #{amount_of_safe_reports}, line: #{line}") if log_details
    end
    pp("amount_of_safe_reports: #{amount_of_safe_reports}") if log_result
    amount_of_safe_reports
  end

  private

  def save_report?(data:)
    differences = []
    (0..data.length - 2).each do |index|
      current_item = data[index]
      next_item = data[index + 1]

      differences << next_item - current_item
    end
    return true if save_differences?(differences:)

    can_problem_dampener_fix?(data:)
  end

  def problem_dampener_applicable?(data:, problem_dampener_tolerance: 1)
    original_data_length = input[0].length
    needed_tolerance = original_data_length - data.length
    needed_tolerance <= problem_dampener_tolerance
  end

  def can_problem_dampener_fix?(data:)
    fixable = false
    (0..data.length - 1).each do |index|
      list = data.dup
      removed_item = list.delete_at(index)

      break if fixable
      next unless problem_dampener_applicable?(data: list)

      if save_report?(data: list)
        pp "  removing #{removed_item} at position #{index} makes report safe" if log_details
        fixable = true
        break
      end
    end

    fixable
  end
end
