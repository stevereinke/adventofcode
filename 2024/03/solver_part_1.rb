class SolverPart1
  attr_reader :input, :log_result, :log_details

  def initialize(file:, log_result: true, log_details: false)
    process_input(file:)
    @log_result = log_result
    @log_details = log_details
  end

  def solve
    products = []
    regex = /mul\(\d{1,3},\d{1,3}\)/
    matches = input.scan(regex)
    matches.each do |match|
      numbers = match.scan(/\d{1,3}/)
      number1 = numbers[0].to_i
      number2 = numbers[1].to_i
      product = number1 * number2
      products << product
      pp("#{number1} * #{number2} = #{product}") if log_details
    end
    sum = products.sum
    pp("sum: #{sum}, (#{products.join(' + ')})") if log_result
    sum
  end

  private

  def process_input(file:)
    @input = File.read(file)
  end
end
