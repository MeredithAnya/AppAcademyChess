require_relative 'piece'
require_relative 'sliding'

class Bishop < Piece
  include Sliding

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    @color == :black ? " \u265D  " : " \u2657  "
  end

  def generate_moves
    diag_slide(@pos)
  end

end
