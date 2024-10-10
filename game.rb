# frozen_string_literal: true

# Class representing important data for a tic-tac-toe game.
#
# This class provides methods to:
#  - Request and take an input from a player
#  - Toggle between players
#  - Check a winner
class Game
  attr_reader :moves_made, :current_sym, :current_move, :game_finished, :winner

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
    @winner = nil
  end

  def ask_for_move
    @current_move = -1
    until @current_move.to_i > -1
      print "Player #{@current_sym}, please enter available number (1-9), where You want to place your symbol: "
      player_input = $stdin.gets.chomp

      @current_move = player_input if player_input.match(/^[1-9]$/)
    end
    @current_move
  end

  def check_winner(array, position)
    winning_combination = WINNING_COMBINATIONS.find do |combination|
      combination.include?(position) && combination.map { |index| array[index] }.uniq.length == 1
    end

    if winning_combination
      puts "Player #{array[winning_combination[0]]} has won!"
      @winner = array[winning_combination[0]]
      @game_finished = true
    end
    return unless @moves_made == 9 && !@game_finished

    puts 'Draw.'
    @winner = 'draw'
    @game_finished = true
  end

  def sym_toggle
    @current_sym = @current_sym == 'X' ? 'O' : 'X'
    @moves_made += 1
  end
end