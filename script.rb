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

# Class representing important data for a tic-tac-toe game.
#
# This class provides methods to:
#  - Request and take an input from a player
#  - Toggle between players
#  - Check a winner
class Game
  attr_reader :moves_made, :current_sym, :current_move, :game_finished

  WINNING_COMBINATIONS = [[0, 1, 2].freeze,
                          [0, 3, 6].freeze,
                          [0, 4, 8].freeze,
                          [3, 4, 5].freeze,
                          [6, 7, 8].freeze,
                          [6, 4, 2].freeze,
                          [1, 4, 7].freeze,
                          [2, 5, 8].freeze].freeze

  def initialize
    @moves_made = 0
    @current_sym = 'X'
    @current_move = -1
    @game_finished = false
  end

  def ask_for_move
    @current_move = -1
    until @current_move.to_i > -1
      print "Player #{@current_sym}, please enter available number (1-9), where You want to place your symbol: "
      player_input = gets.chomp

      @current_move = player_input if player_input.match(/[1-9]/)
    end
    @current_move
  end

  def check_winner(array, position)
    winning_combination = WINNING_COMBINATIONS.find do |combination|
      combination.include?(position) && combination.map { |index| array[index] }.uniq.length == 1
    end

    if winning_combination
      puts "Player #{array[winning_combination[0]]} has won!"
      @game_finished = true
    end
    return unless @moves_made == 9 && !@game_finished

    puts 'Draw.'
    @game_finished = true
  end

  def sym_toggle
    @current_sym = @current_sym == 'X' ? 'O' : 'X'
    @moves_made += 1
    @current_move = -1
  end
end

board = Board.new
game = Game.new
board.print_board
until game.game_finished

  # Ask for an entry and if it is invalid, keep asking until it is valid
  valid_entry = board.check_input(game.ask_for_move)
  valid_entry = board.check_input(game.ask_for_move) until valid_entry

  # Insert a symbol, print the board, and change symbol for next play
  board.insert_symbol(game.current_sym, game.current_move)
  board.print_board
  played_position = game.current_move
  game.sym_toggle

  game.check_winner(board.board_array.flatten, played_position.to_i - 1) if game.moves_made > 4
end
