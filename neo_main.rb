require "tty-prompt"
require_relative "lib/tty_prompt"
require_relative "lib/player"
require_relative "lib/player_turn"
require_relative "lib/move_record"
require_relative "lib/game_verdict"

player_one = Player.new(name: "PLAYER 1", mark: "X", turn: true)
player_two = Player.new(name: "PLAYER 2", mark: "O", turn: false)
player_turn = PlayerTurn.new(p1_turn: player_one.turn, p2_turn: player_two.turn)
move_record = MoveRecord.new
game_verdict = GameVerdict.new
prompt = TTYWrapper.new

9.times do
  player_turn.print_current_turn(player_one.name, player_two.name)

  selected_move = prompt.select_move(
    question: "Pick your move",
    choices: move_record.prompt_choices_array
  )
  current_player_mark = player_turn.current_player_mark(player_one.mark, player_two.mark)

  move_record.update_played_moves_array(selected_move, current_player_mark)
  move_record.update_prompt_choices_array(selected_move)
  return if game_verdict.check_game_verdict(move_record.played_moves_array) == "win"

  player_turn.next_turn
end
