require './game'
require './board'

describe 'Tic-Tac-Toe Game Integration' do
  let(:game) { Game.new }
  let(:board) { Board.new }


  describe 'Full Game flow' do
    
    it 'Plays a game where X wins.' do
      board.print_board
      moves = %w[das asdads dasads das 42423423 1 2 3 4 5 6 7 8 9]
      allow($stdin).to receive(:gets).and_return(*moves)

      until game.game_finished
        valid_entry = board.check_input(game.ask_for_move)
        valid_entry = board.check_input(game.ask_for_move) until valid_entry

        board.insert_symbol(game.current_sym, game.current_move)
        board.print_board
        played_position = game.current_move
        game.sym_toggle

        game.check_winner(board.board_array.flatten, played_position.to_i - 1) if game.moves_made > 4
      end

      expect(game.winner).to eql('X')
    end

    it 'Plays a game where O wins.' do
      board.print_board
      moves = %w[1 2 3 5 4 8]
      allow($stdin).to receive(:gets).and_return(*moves)

      until game.game_finished
        valid_entry = board.check_input(game.ask_for_move)
        valid_entry = board.check_input(game.ask_for_move) until valid_entry

        board.insert_symbol(game.current_sym, game.current_move)
        board.print_board
        played_position = game.current_move
        game.sym_toggle

        game.check_winner(board.board_array.flatten, played_position.to_i - 1) if game.moves_made > 4
      end

      expect(game.winner).to eql('O')
    end

    it 'Plays a draw.' do
      board.print_board
      moves = %w[1 2 3 4 5 7 6 9 8]
      allow($stdin).to receive(:gets).and_return(*moves)

      until game.game_finished
        valid_entry = board.check_input(game.ask_for_move)
        valid_entry = board.check_input(game.ask_for_move) until valid_entry

        board.insert_symbol(game.current_sym, game.current_move)
        board.print_board
        played_position = game.current_move
        game.sym_toggle

        game.check_winner(board.board_array.flatten, played_position.to_i - 1) if game.moves_made > 4
      end

      expect(game.winner).to eql('draw')
    end
  end
end