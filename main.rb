require "tty-prompt"
require_relative "lib/players"
require_relative "lib/tty_prompt"
require_relative "lib/game_record"
require_relative "lib/game_set"

player_one = Player.new(name: "PLAYER 1", mark: "X", turn: true)
player_two = Player.new(name: "PLAYER 2", mark: "O", turn: false)
game_record = GameRecord.new
game_set = GameSet.new
prompt = TTYWrapper.new

Player.get_players(player_one, player_two)

Player.log_current_turn
played_move = prompt.select_move(question: "Pick your move", choices: game_record.choices_arr)
game_record.update_move_registry(played_move)
game_record.update_choices_array(played_move)
game_set.check_game_result(game_record)
