require_relative 'piece'

class Board

  def initialize
    @grid = Array.new(8) {Array.new(8) {Piece.new()}}
  end

  def move(start, end_pos)
    if valid_move?(start, end_pos)
      raise InvalidMoveError #off the Board
    end
  end

  #may change!
  def valid_move?(start, end_pos)
    piece = @grid[start]
      piece.valid_move?(end_pos)

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

end
