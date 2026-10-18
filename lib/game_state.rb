# creates and updates data structures for storing game state
class GameState
  attr_reader :choices_arr, :move_registry

  def initialize
    @choices_arr = GameState.create_choices_arr
    @move_registry = GameState.create_move_registry
  end

  def self.create_choices_arr # rubocop:disable Metrics/MethodLength
    [
      { name: "cell-1", value: "one" },
      { name: "cell-2", value: "two" },
      { name: "cell-3", value: "three" },
      { name: "cell-4", value: "four" },
      { name: "cell-5", value: "five" },
      { name: "cell-6", value: "six" },
      { name: "cell-7", value: "seven" },
      { name: "cell-8", value: "eight" },
      { name: "cell-9", value: "nine" }
    ]
  end

  def self.create_move_registry
    { one: nil, two: nil, three: nil,
      four: nil, five: nil, six: nil,
      seven: nil, eight: nil, nine: nil }
  end

  def update_move_registry(played_move)
    puts played_move
  end
end
