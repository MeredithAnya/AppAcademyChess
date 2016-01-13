require_relative 'piece'
require_relative '../stepping'

class Knight < Piece
  include Stepping

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    color == :black ? " \u265E  " : " \u2658  "
  end

  def generate_moves
    knight_step(pos)
  end

  def deep_dup(duped_board)
    pos_dup = pos.dup
    Knight.new(duped_board, color, pos_dup)
  end
end
