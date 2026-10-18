require "tty-prompt"
require_relative "lib/players"
require_relative "lib/tty_prompt"

player_one = Player.new(name: "PLAYER 1", mark: "X", turn: true)
player_two = Player.new(name: "PLAYER 2", mark: "O", turn: false)
prompt =     TTYWrapper.new

Player.get_players(player_one, player_two)

Player.current_turn
prompt.select(question: "Pick your move", choices: %w[1 2 3 4 5 6 7 8 9])

Player.next_turn
Player.current_turn
prompt.select(question: "Pick your move", choices: %w[1 2 3 4 5 6 7 8 9])

Player.next_turn
Player.current_turn
prompt.select(question: "Pick your move", choices: %w[1 2 3 4 5 6 7 8 9])
