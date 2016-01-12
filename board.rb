require_relative 'pieces'

class Board
  attr_reader :grid

  def initialize()
    @grid = Array.new(8) {Array.new(8) {NullPiece.new(self)}}
    @white_pieces = []
    @black_pieces = []
    populate
  end

  def populate
    populate_strong
    populate_pawn
  end

  def in_check?(color)

    grid.each do |row|
      row.each do |piece|
        if (piece.is_a?(King)) && (piece.color == color)
          king_to_check = piece
        end
      end
    end

    grid.each do |row|
      row.each do |piece|
        if piece.color == king_to_check.opposite_color
          #maybe switch to generate moves
          moves = piece.generate_moves
          return true if moves.include(king_to_check.pos)
        end
      end
    end

    false
  end

  # def checkmate?
  #
  # end

  def move(start, end_pos)
    piece_to_move = grid[start[0]][start[1]]

    if piece_to_move.empty? || !(in_bounds?(end_pos))
      raise ArgumentError
    end

    # unless piece.valid_move?(end_pos)
    #   raise ArgumentError
    # end


    move!(start, end_pos)
  end

  def move!(start, end_pos)

    piece_to_move = grid[start[0]][start[1]]
    grid[end_pos[0]][end_pos[1]] = piece_to_move
    piece_to_move.pos = end_pos
    piece_to_move.first_move = false

    grid[start[0]][start[1]] = NullPiece.new(self)

  end

  def in_bounds?(pos)
    (pos.max < grid.length) && (pos.min >= 0)
  end

  #syntactic sugar
  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  private

  #populating the board!
  def pieces_array
    strong_array = Array.new(8)

    strong_array[0], strong_array[7] = Rook.new(self, nil, nil), Rook.new(self, nil, nil)
    strong_array[1], strong_array[6] = Knight.new(self, nil, nil), Knight.new(self, nil, nil)
    strong_array[2], strong_array[5] = Bishop.new(self, nil, nil), Bishop.new(self, nil, nil)
    strong_array[4] = Queen.new(self, nil, nil)
    strong_array[3] = King.new(self, nil, nil)

    strong_array
  end

  def populate_strong
    target_rows = [0,7]
    target_rows.each do |row|
      strong_pieces = pieces_array
      grid[row].each_with_index do |_, ind|
        piece = strong_pieces[ind]
        piece.pos = [row,ind]
        grid[row][ind] = piece
        piece.color = colorize_piece(row)
        fill_piece_array(piece)
      end
    end
  end

  def populate_pawn
    target_rows = [1,6]
    target_rows.each do |row|
      grid[row].each_with_index do |_,ind|
        piece = Pawn.new(self, nil, [row,ind])
        grid[row][ind] = piece
        piece.color = colorize_piece(row)
        fill_piece_array(piece)
      end
    end
  end

  def colorize_piece(row)
    return :white if ((row == 0) || (row == 1))
    return :black
  end

  def fill_piece_array(piece)
    case piece.color
    when :black
      @black_pieces << piece
    when :white
      @white_pieces << piece
    end
  end

end
