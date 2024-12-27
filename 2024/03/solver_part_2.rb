class SolverPart2
  attr_reader :input, :log_result, :log_details

  def initialize(file:, log_result: true, log_details: false)
    process_input(file:)
    @log_result = log_result
    @log_details = log_details
  end

  def solve
    products = []
    mul_enabled = true
    regex_mul = /mul\(\d{1,3},\d{1,3}\)/
    regex_do = /do\(\)/
    regex_dont = /don't\(\)/
    matches = input.scan(/#{regex_mul}|#{regex_dont}|#{regex_do}/)
    matches.each do |match|
      case match
      when regex_mul
        next unless mul_enabled

        numbers = match.scan(/\d{1,3}/)
        number1 = numbers[0].to_i
        number2 = numbers[1].to_i
        product = number1 * number2
        products << product
        pp("#{number1} * #{number2} = #{product}") if log_details
      when regex_dont
        mul_enabled = false
        pp('disable multiplications') if log_details
      when regex_do
        mul_enabled = true
        pp('enable multiplications') if log_details
      end
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
