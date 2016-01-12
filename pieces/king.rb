require_relative 'piece'
require_relative '../stepping'

class King < Piece
  include Stepping
  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    color == :black ? " \u265A  " : " \u2654  "
  end

  def generate_moves
    king_step(pos)
  end
end
