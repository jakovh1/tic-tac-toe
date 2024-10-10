require './game'

describe Game do
  describe '#ask_for_move' do
    let(:game) { Game.new }

    it 'Prompts user to enter number of a position and returns that number.' do
      allow($stdin).to receive(:gets).and_return('5')
      expect(game.ask_for_move).to eql('5')
    end

    it 'Prompts user to enter number of a position, keeps prompting until it gets the valid input.' do
      allow($stdin).to receive(:gets).and_return('-1', '32', 'a', 'abc', '523§$§', '9')
      expect(game.ask_for_move).to eql('9')
    end
  end

  describe '#sym_toggle' do
    let(:game) { Game.new }

    it 'Toggles the @current_sym instance variable after each turn and updates instance variables @current_move and @moves_made.' do
      expect(game.current_sym).to eql('X')
      expect(game.moves_made).to eql(0)

      game.sym_toggle

      expect(game.current_sym).to eql('O')
      expect(game.moves_made).to eql(1)
    end
  end
end