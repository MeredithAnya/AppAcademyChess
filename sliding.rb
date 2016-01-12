module Sliding

  PERP = [[1,0],[-1,0],[0,1],[0,-1]]
  DIAG =  [[1,1],[-1,1],[1,-1],[-1,-1]]
  MAX_NUM = 8

  def perp_slide(start_pos)
    slide(start_pos, PERP)
  end

  def diag_slide(start_pos)
    slide(start_pos, DIAG)
  end

  def slide(start_pos, diff_array)
    result = []

    diff_array.each do |diff|
      test_pos = [start_pos[0]+diff[0], start_pos[1]+diff[1]]

      while slide_valid_move?(test_pos)
        result << test_pos
        if @board[test_pos].opposite_color
          break
        end
        test_pos = [test_pos[0]+diff[0], test_pos[1]+diff[1]]
      end

    end
    result
  end

  def slide_valid_move?(pos)
    @board.in_bounds?(pos) && valid_move?(pos)
  end
  
end
