require 'colorize'
require_relative 'cursorable'
require_relative 'board'

class Display
  include Cursorable
  attr_accessor :board, :game, :cursor_pos

  def initialize(board=nil)
    @board = board
    @game = nil
    @cursor_pos = [0,0]
    @selected = false
  end

  #colors to use
  # :black, :white, :magenta

  def build_grid
    @board.grid.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i,j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i,j)
    if [i,j] == @cursor_pos
      bg = :light_red
    elsif (i+j).odd?
      bg = :light_black
    else
      bg = :black
    end
    {background: bg, color: :white}
  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }
  end

  def test_display
    selected = nil
    until selected
      render
      selected = get_input
    end
    selected
  end



end
