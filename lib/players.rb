class Player
  attr_reader :mark, :turn

  def initialize(mark:, turn:)
    @mark = mark
    @turn = turn
  end
end
