# creates and updates data structures for storing game state
class GameRecord < Player
  attr_reader :choices_arr, :move_registry

  def initialize # rubocop:disable Lint/MissingSuper
    @choices_arr = GameRecord.create_choices_arr
    @move_registry = GameRecord.create_move_registry
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
    [
      { one: nil, two: nil, three: nil },
      { four: nil, five: nil, six: nil },
      { seven: nil, eight: nil, nine: nil }
    ]
  end

  def update_move_registry(played_move)
    @move_registry.each do |element|
      element.each_key do |key|
        element[key] = Player.current_turn.map(&:mark).join if key.to_s == played_move
      end
    end
    # puts @move_registry
  end

  def update_choices_array(played_move)
    @choices_arr.map do |element|
      element[:disabled] = "" if element[:value] == played_move
    end
    # puts @choices_arr
  end
end
