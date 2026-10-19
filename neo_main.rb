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
selected_move = Player.play_move(prompt, move_record)
