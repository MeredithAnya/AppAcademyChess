require_relative 'piece'

class Board
  def initialize
    @grid = Array.new(8) {Array.new(8) {Piece.new()}}
  end
end
