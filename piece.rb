class NullPiece
  def initialize(pos = nil)
    @pos = pos
  end

  def valid_move?(end_pos)
    false
  end

  def to_s
    return "    "
  end

  def moves
    puts "I'm a null piece you dum dum"
  end
  

end
