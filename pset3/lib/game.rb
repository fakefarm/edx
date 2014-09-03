class Game
  attr_accessor :board

  def initialize
    @board = [
      [15, 14, 13, 12],
      [11, 10, 9, 8],
      [7, 6, 5, 4],
      [3, 2, 1, "X"],
    ]
  end

  def move(number, direction)
    is_move_legal?(number, direction)
    make_move(direction, number)
    print_board
  end

  private

  def print_board
    @board.each do |row|
      p row
    end
  end

  def make_move(direction, number)
    row_containing_number = find_array_with_number(number)
    row_containing_number = board[row_containing_number]

    row_containing_open_space = board[row_with_open_space]
    number_index = row_containing_number.index(number)
    open_number_index = row_containing_open_space.index("X")

    if direction == "right" || direction == "left"
      row_containing_number[number_index] = "X"
      row_containing_number[open_number_index] = number
    else
      row_containing_number[number_index] = "X"
      row_containing_open_space[open_number_index] = number
    end
  end


  def find_array_with_number(number)
    @board.each_with_index do |row, i|
      if row.include?(number)
        return i
      end
    end
  end

  def is_move_legal?(number, direction)
    index_of_row_with_number = find_array_with_number(number)
    row_with_number = board[index_of_row_with_number]
    number_index = row_with_number.index(number)

    case true
      when index_of_row_with_number == 0 && direction == "up"
        raise "Not Allowed"
      when index_of_row_with_number == 3 && direction == "down"
        raise "Not Allowed"
      when number_index == 0 && direction == "left"
        raise "Not Allowed"
      when number_index == 3 && direction == "right"
        raise "Not Allowed"
      when direction == "right" && row_with_number[(number_index + 1)] != "X"
        raise "Not Allowed"
      when direction == "left" && row_with_number[(number_index - 1)] != "X"
        raise "Not Allowed"
      when direction == "down" && @board[index_of_row_with_number + 1][number_index] != "X"
        raise "Not Allowed"
      when direction == "up" && @board[index_of_row_with_number - 1][number_index] != "X"
        raise "Not Allowed"
    end
  end

  def row_with_open_space
    @board.each_with_index do |row, i|
      if row.include?("X")
        return i
      end
    end
  end
end