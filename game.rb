require_relative 'board'
require_relative 'display'

class Game

  def initialize(player1, player2, board=Board.new)
    @board = board
    @player1, @player2 = player1, player2
    @display = Display.new(board)
    @current_player = @player1
  end

  def play

    until game_over?
      play_turn(@current_player)
      switch_player!
    end

  end

  def switch_player!
    @current_player == @player1 ? (@current_player = @player2) :
    (@current_player = @player1)
  end

  def game_over?
    false
  end

  def play_turn(player)


    start_user_input, end_user_input = nil, nil

    until start_user_input
      @display.render
      start_user_input = @display.get_input
    end

    @display.selected = true

    until end_user_input
      @display.render
      end_user_input = @display.get_input
    end

    @board.move(start_user_input, end_user_input)
    @display.selected = false

  end

end
