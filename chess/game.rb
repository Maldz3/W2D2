require_relative 'display.rb'
require_relative 'players.rb'
require 'byebug'
require_relative 'piece.rb'

class Game

  def initialize(player1, player2)
    @board = Board.new
    @display = Display.new(@board)
    @player1 = Player.new(player1, :w)
    @player2 = Player.new(player2, :b)
    @active_player = @player1
  end

  def play
    loop do #until @board.checkmate?
      system("clear")
      move = get_move_from_player
      if @board[move[0]].moves(move[0]).include?(move[1])
        @board.move_piece(move[0], move[1])
        @board[move[0]] = NullPiece.instance
        self.switch_player
      end
    end
  end

  def switch_player
    @active_player == @player1 ? @player2 : @player1
  end

  def get_move_from_player
    start_pos = nil
    end_pos = nil
    loop do
      @display.render
      pos = @display.cursor.get_input
      if pos && @board[pos].color == @active_player.color
        #byebug
        start_pos = pos.dup
        system("clear")
        break
      end
      system("clear")
    end
    #byebug
    loop do
      @display.render
      pos = @display.cursor.get_input
      if pos
        #byebug
        end_pos = pos.dup
        system("clear")
        break
      end
      system("clear")
    end
    #byebug
    [start_pos, end_pos]
  end

end

game = Game.new('maliha', 'miles')
game.play
