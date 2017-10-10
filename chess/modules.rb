module Singleton
end

module SteppingPiece

  def moves(start_position, move_type)
    potential_moves = []
    if move_type == :single
      x_shift = (-1..1).to_a
      y_shift = (-1..1).to_a
      x_shift.each do |x|
        y_shift.each do |y|
          unless x == 0 && y == 0
            potential_moves << [start_position[0] + x, start_position[1] + y]
          end
        end
      end
    elsif move_type == :hop
      knight_moves = [
      [-2, -1],
      [-2,  1],
      [-1, -2],
      [-1,  2],
      [ 1, -2],
      [ 1,  2],
      [ 2, -1],
      [ 2,  1]
      ]
      knight_moves.each do |x|
        potential_moves << [start_position[0] + x[0], start_position[1] + x[1]]
      end
    end
    potential_moves.select { |pos| pos.all? { |coord| coord >= 0 && coord < 8 } }
  end

  private

  def move_diffs
  end

end

module SlidingPiece

  def moves

  end

  private

  def mov_dirs

  end

  def horizontal_dirs

  end

  def diagonal_dirs

  end

  def grow_unblocked_moves_in_direction(dx, dy)

  end


end
