class Piece

  #refactor
  attr_reader :board
  attr_accessor :first_move, :pos, :color, :king

  def initialize(board, color=nil, pos=nil)
    @board = board
    @color = color
    @pos = pos
    @first_move = false
    @king = false
  end

  def empty?
    false
  end

  def inspect
    to_s
  end

  #opposite color make a question mark
  def opposite_color
    unless @color.nil?
      @color == :black ? :white : :black
    end
  end

  def valid_move?(end_pos)
    piece = @board[end_pos]
    if self.color == piece.color
      false
    elsif piece.empty?
      true
    elsif self.color != piece.color
      true
    end
  end

  def valid_moves
    results = []
    moves = generate_moves
    moves.each do |move|
      duped_board = board.deep_dup
      duped_board.move!(pos, move)
      results << move unless duped_board.in_check?(color)
    end
    p results
  end

end


#hit other team
