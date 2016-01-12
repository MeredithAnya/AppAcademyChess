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


end
