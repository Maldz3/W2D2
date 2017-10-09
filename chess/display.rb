require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display
  def initialize (board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    str = "  ------------------------- \n"
    display_i = 8
    row_i = 0
    while display_i > 0
      str << "#{display_i} |"
      display_i -= 1
      8.times do |column_i|
        if [row_i, column_i] == @cursor.cursor_pos
          str << "X |".colorize(:blue)
        else
          str << "X |" #@board[row_idx, column_idx]
        end
      end
      str << "\n"
      row_i += 1
    end
    str << "  ------------------------- \n"
    str << '   A  B  C  D  E  F  G  H '
    puts str
  end

  def looper
    while true
      self.render
      @cursor.get_input
    end
  end

end

x = Board.new
d = Display.new(x)
d.looper
