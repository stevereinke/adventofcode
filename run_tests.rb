require 'colorize'

args = ARGV

year = args[0] || '*'
day = args[1] || '*'
part = args[2] || '*'

tests = Dir.glob(File.join(year, day, "test_part_#{part}.rb"))

puts "Running #{tests.count} tests for #{year}, #{day}, #{part}:"

tests.each do |test|
  command = "cd #{File.dirname(test)}; ruby #{File.basename(test)}; cd -"
  result = %x(#{command}).to_s
  output = ''

  if result.include?('test passed')
    output << test.colorize(:green)
    output << "\n" + result
  else
    output << test.colorize(:red)
    output << "\n" + result
  end
  puts output
end
