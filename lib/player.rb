# makes player play a move
class Player
  attr_reader :name, :mark, :turn

  def initialize(name:, mark:, turn:)
    @name = name
    @mark = mark
    @turn = turn
  end

  def self.play_move(prompt, move_record)
    prompt.select_move(question: "Pick your move", choices: move_record.prompt_choices_array)
  end
end
