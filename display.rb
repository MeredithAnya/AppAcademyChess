require 'colorize'

class Display

  attr_accessor :board, :game

  def initialize(board=nil)
    @board = nil
    @game = nil
    @cursor_pos = [0,0]
    @selected = false
  end




end
