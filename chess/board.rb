require_relative 'piece.rb'

class Board

  #attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    [[0, 0], [7, 7], [0, 7], [7, 0]].each do |pos|
      self[pos] = Rook.new #rooks
    end
    [[0, 1], [0, 6], [7, 1], [7, 6]].each do |pos|
      self[pos] = Knight.new #knights
    end
    [[0, 2], [0, 5], [7, 2], [7, 5]].each do |pos|
      self[pos] = Bishop.new #bishops
    end
    [[0, 3], [7, 3]].each do |pos|
      self[pos] = Queen.new #queens
    end
    [[0, 4], [7, 4]].each do |pos|
      self[pos] = King.new #kings
    end
    i = 0
    while i < 8
      self[[1, i]] = Pawn.new #pawns
      self[[6, i]] = Pawn.new #pawns
      i2 = 2
      while i2 < 6
        self[[i2, i]] = nil #nullpieces
        i2 += 1
      end
      i += 1
    end
    [0, 1, 6, 7].each do |row|
      if row < 3
        @grid[row].each { |piece| piece.set_black }
      else
        @grid[row].each { |piece| piece.set_white }
      end
    end

  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def move_piece(start_pos, end_pos)
    raise "Error: no piece located at #{start_pos}." if self[start_pos].nil?
    raise "Error: invalid destination for piece." unless valid_pos?(end_pos)
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def valid_pos?(pos)
    return false if pos.length > 2
    return false if pos.any? { |el| el > 7 || el < 0 }
    true
  end





end
