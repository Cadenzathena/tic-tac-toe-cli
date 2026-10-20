# updates game statistics
class MoveRecord
  attr_reader :prompt_choices_array, :played_moves_array

  def initialize
    @prompt_choices_array = init_prompt_choices_array
    @played_moves_array = init_played_moves_array
  end

  private

  def init_prompt_choices_array # rubocop:disable Metrics/MethodLength
    [
      { name: "cell-1", value: 1 },
      { name: "cell-2", value: 2 },
      { name: "cell-3", value: 3 },
      { name: "cell-4", value: 4 },
      { name: "cell-5", value: 5 },
      { name: "cell-6", value: 6 },
      { name: "cell-7", value: 7 },
      { name: "cell-8", value: 8 },
      { name: "cell-9", value: 9 }
    ]
  end

  def init_played_moves_array
    [
      { one: 1, two: 2, three: 3 },
      { four: 4, five: 5, six: 6 },
      { seven: 7, eight: 8, nine: 9 }
    ]
  end

  public

  def update_played_moves_array(selected_move, current_player_mark)
    @played_moves_array.each do |element|
      element.transform_values! do |value|
        selected_move == value ? current_player_mark : value
      end
    end
    puts @played_moves_array
  end

  def update_prompt_choices_array(selected_move)
    @prompt_choices_array.at(selected_move - 1)[:disabled] = ""
  end
end
