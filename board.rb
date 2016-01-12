require_relative 'piece'
require_relative 'null_piece'

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) {Array.new(8) {NullPiece.new(self)}}
  end

  def move(start, end_pos)

    piece_to_move = grid[start[0]][start[1]]

    if piece_to_move.empty? || in_bounds(end_pos)
      raise InvalidMoveError
    end

    grid[end_pos[0]][end_pos[1]] = piece_to_move
    piece_to_move.pos = end_pos

    grid[start[0]][start[1]] = NullPiece.new()

  end

  #may change!
  # def valid_move?(start, end_pos)
  #   piece = @grid[start[0]][start[1]]
  #   in_bounds(end_pos) && piece.valid_move?(end_pos)
  # end

  #write later
  def in_bounds?(pos)
    (pos.max < grid.length) && (pos.min >= 0)
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

end
