require 'colorize'
require 'byebug'
require_relative 'modules.rb'
require 'singleton'

class Piece

  attr_reader :color

  def initialize(pos = nil, board = nil)
    @color = nil
    @position = pos
    @board = board
  end

  def set_white
    @color = :w
  end

  def set_black
    @color = :b
  end

  def to_s
    if @color == :w
      #byebug
      @symbol.colorize(:magenta)
    else
      @symbol.colorize(:cyan)
    end

  end

  def empty?
  end

  def symbol
  end

  def valid_moves
  end

  private

  def move_into_check(to_pos)
  end

end




class Queen < Piece
  include SlidingPiece
  def initialize(pos, board)
    @symbol = 'Q'
    @move_type = [:diagonal, :horizontal]
    super
  end

end

class King < Piece
  include SteppingPiece
  def initialize(pos, board)
    @symbol = 'K'
    @move_type = [:single]
    super
  end
end

class Rook < Piece
  include SlidingPiece
  def initialize(pos, board)
    @move_type = [:horizontal]
    @symbol = "R"
    super
  end
end

class Knight < Piece
  include SteppingPiece
  def initialize(pos, board)
    @symbol = 'N'
    @move_type = [:hop]
    super
  end
end

class Bishop < Piece
  include SlidingPiece
  def initialize(pos, board)
    @move_type = [:diagonal]
    @symbol = 'B'
    super
  end
end

class Pawn < Piece
  def initialize(pos, board)
    @symbol = 'p'
    @moved_before = false
    super
  end

  def moves(pos)
    array =[]
    if !@moved_before ################ to do
      if @color == :b
        array << [pos[0] + 1, pos[1]]
        array << [pos[0] + 2, pos[1]]
      else
        array << [pos[0] - 1, pos[1]]
        array << [pos[0] - 2, pos[1]]
      end
    else
      if @color == :b
        array << [pos[0] + 1, pos[1]]
      else
        array << [pos[0] - 1, pos[1]]
      end
    end
    array.reject! { |move| @board[move].color == :w || @board[move].color == :b } ######### to do
    attack_array = []
    if @color == :b
      attack_array << [pos[0] + 1, pos[1] + 1]
      attack_array << [pos[0] + 1, pos[1] - 1]
    else
      attack_array << [pos[0] - 1, pos[1] + 1]
      attack_array << [pos[0] - 1, pos[1] - 1]
    end
    attack_array.reject! { |move| @board[move].color == self.color || @board[move].color == nil}
    array.concat(attack_array)
  end

end

class NullPiece < Piece
  include Singleton

  def to_s
    "_"
  end
end
