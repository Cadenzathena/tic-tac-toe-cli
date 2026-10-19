# makes player play a move
class Player
  attr_reader :name, :mark, :turn

  def initialize(name:, mark:, turn:)
    @name = name
    @mark = mark
    @turn = turn
  end
end
