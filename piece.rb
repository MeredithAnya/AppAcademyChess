class Piece

  def initialize(board, color=nil, pos=nil)
    @board = board
    @color = color
    @pos = pos
  end

  def empty?
    false
  end

  #opposite
  def opposite_color
  end

  def valid_move(end_pos)
    piece = @board[end_pos]
    if self.color == piece.color
      false
    elsif piece.empty?
      true
    elsif self.color != piece.color
      true
    end
  end

end


#hit other team
