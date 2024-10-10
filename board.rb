# frozen_string_literal: true

# Class represnting a tic-tac-toe board.
#
# This class provides methods to:
#  - Print the board to the terminal
#  - Check incoming input from a player
#  - Insert symbols into the board
class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(3) { |i| Array.new(3) { |j| i * 3 + j + 1 } }
  end

  def print_board
    @board_array.each_with_index do |row, row_index|
      puts '   |   |  ' if row_index.zero?

      row.each_with_index do |element, element_index|
        print " #{element} "
        print '|' unless element_index == row.length - 1
      end

      puts(row_index == @board_array.length - 1 ? "\n   |   |  " : "\n___|___|___\n   |   |  ")
    end
  end

  def insert_symbol(sym, position)
    @board_array = @board_array.flatten
    @board_array[position.to_i - 1] = sym
    @board_array = @board_array.each_slice(3).to_a
  end

  def check_input(input)
    if @board_array.flatten[input.to_i - 1].is_a?(Integer)
      true
    else
      false
    end
  end
end