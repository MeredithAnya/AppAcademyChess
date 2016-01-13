require_relative "../sliding"
require_relative "piece"

class Queen < Piece
  include Sliding

  def initialize(board, color, pos)
    super(board, color, pos)
  end

  def to_s
    @color == :black ? " \u265B  " : " \u2655  "
  end

  def generate_moves
    perp_slide(@pos) + diag_slide(@pos)
  end

  def deep_dup(duped_board)
    pos_dup = pos.dup
    Queen.new(duped_board, color, pos_dup)
  end

end
