class NullPiece
  def initialize(pos = nil)
    @pos = pos
  end

  def valid_move?(end_pos)
    false
  end


end
