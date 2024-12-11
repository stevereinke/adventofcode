require 'colorize'

tests = Dir.glob('**/test_*.rb')

puts "Running #{tests.count} tests:"

tests.each do |test|
  command = "cd #{File.dirname(test)}; ruby #{File.basename(test)}; cd -"
  result = %x(#{command}).to_s
  output = ''

  if result.include?('test passed')
    output << test.colorize(:green)
  else
    output << test.colorize(:red)
    output << "\n" + result
  end
  puts output
end
