class SolverPart1
  attr_reader :input, :log_result, :log_details

  def initialize(file:, log_result: true, log_details: false)
    process_input(file:)
    @log_result = log_result
    @log_details = log_details
  end

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
    save_differences?(differences:)
  end

  def save_differences?(differences:)
    return false unless differences.all? { |difference| save_difference?(difference:) }

    differences.all?(&:positive?) || differences.all?(&:negative?)
  end

  def save_difference?(difference:)
    [1, 2, 3].include?(difference.abs)
  end

  def process_input(file:)
    @input = File.read(file).split("\n").map { |line| line.split(/\s+/).compact.map(&:to_i) }
  end
end
