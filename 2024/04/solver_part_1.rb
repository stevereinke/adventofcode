class SolverPart1
  attr_reader :input, :log_result, :log_details
  attr_reader :all_coordinates_of_matching_letters

  def initialize(file:, log_result: true, log_details: false)
    process_input(file:)
    @log_result = log_result
    @log_details = log_details
  end

  def solve
    @all_coordinates_of_matching_letters = []

    sum =
      (0..input.length - 1).map do |position_y|
        (0..input[position_y].length - 1).map do |position_x|
          matches = search_in_all_directions(position_x:, position_y:)
          matches
        end.sum
      end.sum

    pp "sum: #{sum}" if log_result
    if log_details
      pp 'matrix showing the matches:'
      pp calulate_matched_matrix
    end

    sum
  end

  private

  def search_in_all_directions(position_x:, position_y:)
    top_left = [-1, -1]
    top = [0, -1]
    top_right = [1, -1]
    right = [1, 0]
    down_right = [1, 1]
    down = [0, 1]
    down_left = [-1, 1]
    left = [-1, 0]

    directions = [top_left, top, top_right, right, down_right, down, down_left, left]

    sum = 0
    letter = input[position_x][position_y]

    directions.each do |direction|
      matched = search(position_x:, position_y:, direction_x: direction[0], direction_y: direction[1])
      sum+=1 if matched
    end

    sum
  end

  def search(position_x:, position_y:, direction_x:, direction_y:)
    matched = false
    coordinates = []

    (0..search_term.length - 1).each do |index|
      x = position_x + index * direction_x
      y = position_y + index * direction_y
      if x >=0 && y >= 0 && input[y] && input[y][x] == search_term[index]
        matched = true if index == 0

        # add coordinates to a list so we can build the matched matrix later
        coordinates << [x, y]

        if index == search_term.length - 1
          # add coordinates to the global list so we can build the matched matrix later
          coordinates.each do |pair|
            all_coordinates_of_matching_letters << pair
          end

          if log_details
            out = "pos [#{position_x}, #{position_y}], dir [#{direction_x}, #{direction_y}] "
            out << coordinates.map { |my_x, my_y| "[#{my_x}, #{my_y}, #{input[my_y][my_x]}]" }.join(', ')
            pp out
          end
        end
      else
        matched = false
        break
      end
    end

    matched
  end

  def search_term
    'XMAS'.freeze
  end

  def remove_letter(position_x:, position_y:, direction_x:, direction_y:)
    (0..search_term.length - 1).each do |index|
      x = position_x + index * direction_x
      y = position_y + index * direction_y
    end
  end

  def calulate_matched_matrix
    matched_matrix = input.deep_dup
    flat_list_of_matches = all_coordinates_of_matching_letters.uniq
    (0..matched_matrix.length - 1).each do |y|
      (0..matched_matrix[y].length - 1).each do |x|
        matched_matrix[y][x] = '.' unless flat_list_of_matches.include?([x,y])
      end
    end
    matched_matrix
  end

  def process_input(file:)
    @input = File.read(file).split("\n").map { |line| line.split('') }
  end
end
