require_relative 'solver_part_2'

expected = 31
given = SolverPart2.new(file: File.join('.', 'test.txt')).solve(log_result: false)

pp "expected: #{expected}"
pp "given: #{given}"

if expected == given
  pp "test passed: #{expected} == #{given}"
else
  pp "test failed: #{expected} == #{given}"
end
