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
      { 1 => 1, 2 => 2, 3 => 3 },
      { 4 => 4, 5 => 5, 6 => 6 },
      { 7 => 7, 8 => 8, 9 => 9 }
    ]
  end

  public

  def update_played_moves_array(selected_move, current_player_mark)
    @played_moves_array.map! do |hash|
      hash.to_h do |key, value|
        [key, selected_move == key ? current_player_mark : value]
      end
    end
  end

  def update_prompt_choices_array(selected_move)
    @prompt_choices_array.at(selected_move - 1)[:disabled] = ""
  end

  def print_played_moves_array # rubocop:disable Metrics/AbcSize
    puts "
    #{@played_moves_array[0][1]} | #{@played_moves_array[0][2]} | #{@played_moves_array[0][3]}
    — — — — —
    #{@played_moves_array[1][4]} | #{@played_moves_array[1][5]} | #{@played_moves_array[1][6]}
    — — — — —
    #{@played_moves_array[2][7]} | #{@played_moves_array[2][8]} | #{@played_moves_array[2][9]}
    "
  end
end
