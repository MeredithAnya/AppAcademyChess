require_relative '../sliding'
require_relative 'piece'

class Rook < Piece
  include Sliding

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    @color == :black ? " \u265C  " : " \u2656  "
  end

  def generate_moves
    perp_slide(@pos)
  end

  def deep_dup(duped_board)
    pos_dup = pos.dup
    Rook.new(duped_board, color, pos_dup)
  end
  
end
