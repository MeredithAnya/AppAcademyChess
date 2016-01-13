require_relative 'board'
require_relative 'display'
require_relative 'player'

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
    @board.checkmate?(@current_player.color)
  end

  def play_turn(player)

  begin
    start_user_input, end_user_input = nil, nil

    until start_user_input
      @display.render
      start_user_input = @display.get_input

    end
    raise ArgumentError if @board[start_user_input].color != player.color
    
    until end_user_input
      @display.render
      end_user_input = @display.get_input
    end

    @board.move(start_user_input, end_user_input)
  rescue ArgumentError
    puts "You fucked up!"
    retry
  end
    @display.selected = false

  end

end

p1 = Player.new(:black)
p2 = Player.new(:white)

game = Game.new(p1, p2)
game.play
