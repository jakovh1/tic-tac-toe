# frozen_string_literal: true

require './board'
require './game'

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
