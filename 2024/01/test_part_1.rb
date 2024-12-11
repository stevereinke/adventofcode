require_relative 'solver_part_1'

expected = 11
given = SolverPart1.new(file: File.join('.', 'test.txt')).solve(log_result: false)

pp "expected: #{expected}"
pp "given: #{given}"

if expected == given
  pp "test passed: #{expected} == #{given}"
else
  pp "test failed: #{expected} == #{given}"
end
