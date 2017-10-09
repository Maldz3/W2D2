require_relative 'piece.rb'

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    [[0, 0], [7, 7], [0, 7], [7, 0]].each do |pos|
      self[pos] = Piece.new #rooks
    end
    [[0, 1], [0, 6], [7, 1], [7, 6]].each do |pos|
      self[pos] = Piece.new #knights
    end
    [[0, 2], [0, 5], [7, 2], [7, 5]].each do |pos|
      self[pos] = Piece.new #bishops
    end
    [[0, 3], [7, 3]].each do |pos|
      self[pos] = Piece.new #queens
    end
    [[0, 4], [7, 4]].each do |pos|
      self[pos] = Piece.new #kings
    end
    i = 0
    while i < 8
      self[[1, i]] = Piece.new #pawns
      self[[6, i]] = Piece.new #pawns
      i2 = 2
      while i2 < 6
        self[[i2, i]] = nil #nullpieces
        i2 += 1
      end
      i += 1
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
    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
  end






end
