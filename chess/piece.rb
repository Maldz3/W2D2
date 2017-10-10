require 'colorize'
require 'byebug'
require_relative 'modules.rb'

class Piece
  def initialize
    @color = nil
  end

  def set_white
    @color = :w
  end

  def set_black
    @color = :b
  end

  # def moves
  # end

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
  #include SlidingPiece
  def initialize
    @symbol = 'Q'
    @move_type = [:diagonal, :horizontal]
    super
  end

end

class King < Piece
  include SteppingPiece
  def initialize
    @symbol = 'K'
    @move_type = [:single]
  end
end

class Rook < Piece
  #include SlidingPiece
  def initialize
    @move_type = [:horizontal]
    @symbol = "R"
    super
  end
end

class Knight < Piece
  #include SteppingPiece
  def initialize
    @symbol = 'N'
    @move_type = [:hop]
  end
end

class Bishop < Piece
  #include SlidingPiece
  def initialize
    @move_type = [:diagonal]
    @symbol = 'B'
    super
  end
end

class Pawn < Piece
  def initialize
    @symbol = 'p'
  end

end

class NullPiece
  #include Singleton
end
