class MoveRecord
  attr_reader :prompt_choices_array, :played_moves_hash

  def initialize
    @prompt_choices_array = MoveRecord.init_prompt_choices_array
    @played_moves_hash = MoveRecord.init_played_moves_hash
  end

  def self.init_prompt_choices_array # rubocop:disable Metrics/MethodLength
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

  def self.init_played_moves_hash
    [
      { one: nil, two: nil, three: nil },
      { four: nil, five: nil, six: nil },
      { seven: nil, eight: nil, nine: nil }
    ]
  end
end
