require "tty-prompt"
require_relative "lib/tty_prompt"
require_relative "lib/player"
require_relative "lib/player_turn"
require_relative "lib/move_record"

player_one = Player.new(name: "PLAYER 1", mark: "X", turn: true)
player_two = Player.new(name: "PLAYER 2", mark: "O", turn: false)
player_turn = PlayerTurn.new(p1_turn: player_one.turn, p2_turn: player_two.turn)
move_record = MoveRecord.new
prompt = TTYWrapper.new

player_turn.print_current_turn(p1_name: player_one.name, p2_name: player_two.name)

selected_move = prompt.select_move(
  question: "Pick your move",
  choices: move_record.prompt_choices_array
)
current_player_mark = player_turn.current_player_mark(
  p1_mark: player_one.mark,
  p2_mark: player_two.mark
)

move_record.update_played_moves_array(selected_move, current_player_mark)
move_record.update_prompt_choices_array(selected_move)
