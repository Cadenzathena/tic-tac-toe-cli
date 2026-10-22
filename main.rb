require "tty-prompt"
require "colorize"
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

9.times do |number| # rubocop:disable Metrics/BlockLength
  player_turn.print_current_turn(player_one.name, player_two.name)
  move_record.print_played_moves_array

  selected_move = prompt.select_move(
    question: "Pick your move",
    choices: move_record.prompt_choices_array
  )
  current_player_mark = player_turn.current_player_mark(
    player_one.mark,
    player_two.mark
  )

  move_record.update_played_moves_array(selected_move, current_player_mark)
  move_record.update_prompt_choices_array(selected_move)

  case game_verdict.check_win_verdict(move_record.played_moves_array)
  when "X"
    puts "PLAYER 1 WINS!".colorize(background: :green)
    move_record.print_played_moves_array
    break
  when "O"
    puts "PLAYER 2 WINS!".colorize(background: :green)
    move_record.print_played_moves_array
    break
  end
  if number == 8
    puts "WHAT A DRAW!".colorize(background: :green)
    move_record.print_played_moves_array
    break
  end

  player_turn.next_turn
end
