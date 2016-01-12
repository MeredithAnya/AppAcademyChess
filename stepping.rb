module Stepping
  KING_MOVES = [[1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,1],[1,-1],[-1,-1]]
  KNIGHT_MOVES = [[2,1],[1,2],[-2,1],[-2,-1],[2,-1],[-1,2],[-1,-2],[1,-2]]

  def king_step(start_pos)
    step(start_pos, KING_MOVES)
  end

  def knight_step(start_pos)
    step(start_pos, KNIGHT_MOVES)
  end

  def step(start_pos, diff_array)
    results = []
    diff_array.each do |diff|
      test_pos = [start_pos[0] + diff[0], start_pos[1] + diff[1]]
      results << test_pos if step_valid_move?(test_pos)
    end
    results
  end

  def step_valid_move?(pos)
    @board.in_bounds?(pos) && valid_move?(pos)
  end
end
