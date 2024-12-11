args = ARGV

year = args[0] || '*'
day = args[1] || '*'
part = args[2] || '*'

files = Dir.glob(File.join(year, day, "solution_part_#{part}.rb"))

puts "Running solutions for #{year}, #{day}, #{part}:"

files.each do |file|
  command = "cd #{File.dirname(file)}; ruby #{File.basename(file)}; cd -"
  puts command
  result = %x(#{command}).to_s
  puts result
end
