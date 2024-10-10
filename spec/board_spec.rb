require './board'

describe Board do
  describe '#insert_symbol' do
    it 'Inserts symbol to the provided position (cell) and returns the board in form of array.' do
      board = Board.new
      expect(board.insert_symbol('X', 5)).to eql([[1, 2, 3], [4, 'X', 6], [7, 8, 9]])
    end

    it 'Inserts symbol (O) to the provided position (1) (cell) and returns the board in form of array.' do
      board = Board.new
      expect(board.insert_symbol('O', 1)).to eql([['O', 2, 3], [4, 5, 6], [7, 8, 9]])
    end
  end

  describe '#check_input' do
    it 'Returns "true" if the position where user want to insert its symbol is free of symbols and "false" if it is not.' do
      board = Board.new
      expect(board.check_input(9)).to eql(true)
    end

    it 'Returns "true" if the position where user want to insert its symbol is free of symbols and "false" if it is not.' do
      board = Board.new
      expect(board.check_input(10)).to eql(false)
    end
  end
end
