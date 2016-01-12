require_relative 'piece'

class NullPiece < Piece

  def initialize(board, color=nil, pos=nil)
    super(board, color, pos)
  end

  def empty?
    true
  end

  def valid_move?(end_pos)
    false
  end

  def generate_moves
    []
  end

  def to_s
    "    "
  end

  def moves
    puts "I'm a null piece you dum dum"
  end

end
