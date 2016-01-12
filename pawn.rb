require_relative 'piece'

class Pawn < Piece

  def initialize(board, color, pos)
    super(board, color, pos)
    @first_move = true
  end

  def to_s
    color == :black ? " \u265F  " : " \u2659  "
  end

  def generate_moves
    gen_forward_moves + diag_capture_check
  end

  def gen_forward_moves
    results = []
    diff_array = [[1,0], [2,0]]

    unless first_move?
      diff_array = diff_array.reject {|diff| diff.max > 1}
    end

    diff_array.each do |diff|
      if color == :black
        test_pos = [pos[0]-diff[0], pos[1]-diff[1]]]
      else
        test_pos = [pos[0]+diff[0], pos[1]+diff[1]]
      end

      results << test_pos if valid_move?(test_pos, false)
    end
    results

  end

  def diag_capture_check
    #if white 1,1 1,-1
    #if black -1,-1 -1,1
    results = []
    diff_array = [[1,1],[1,-1]]
    diff_array.each do |diff|
      case color
      when :black
        test_pos = [pos[0]-diff[0],pos[1]-diff[1]]
        results << test_pos if valid_move?(pos, true)
      when :white
        test_pos = [pos[0]+diff[0],pos[1]+diff[1]]
        results << test_pos if valid_move?(pos, true)
      end
    end
    results
  end

  def valid_move?(pos,diag_move)
    if diag_move
      (board[pos].color == opposite_color) && board.in_bounds?(pos)
    else
      board[pos].empty? && board.in_bounds?(pos)
    end
  end
end
