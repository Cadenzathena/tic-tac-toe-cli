require "tty-prompt"
require_relative "lib/players"
require_relative "lib/tty_prompt"

player_one = Player.new(mark: "X", turn: true)
player_two = Player.new(mark: "O", turn: false)
prompt =     TTYWrapper.new

prompt.select(question: "Pick your move", choices: %w[1 2 3 4 5 6 7 8 9])
