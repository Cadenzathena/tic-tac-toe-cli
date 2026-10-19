require "tty-prompt"
require_relative "lib/tty_prompt"
require_relative "lib/player"
require_relative "lib/player_turn"
require_relative "lib/move_record"

player_one = Player.new(name: "PLAYER 1", mark: "X", turn: true)
player_two = Player.new(name: "PLAYER 2", mark: "O", turn: false)
move_record = MoveRecord.new
prompt = TTYWrapper.new

PlayerTurn.load_players(player_one, player_two)
PlayerTurn.print_current_turn

selected_move = prompt.select_move(
  question: "Pick your move",
  choices: move_record.prompt_choices_array
)
move_record.update_played_moves_array(selected_move)
move_record.update_prompt_choices_array(selected_move)
