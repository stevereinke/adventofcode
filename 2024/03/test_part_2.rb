require_relative 'solver_part_2'

expected = 48
given = SolverPart2.new(file: File.join('.', 'test.txt'), log_result: false).solve

pp "expected: #{expected}"
pp "given: #{given}"

if expected == given
  pp "test passed: #{expected} == #{given}"
else
  pp "test failed: #{expected} == #{given}"
end
