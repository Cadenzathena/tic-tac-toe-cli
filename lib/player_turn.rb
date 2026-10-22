# switch to next player turn and check who's turn it is
class PlayerTurn
  def initialize(p1_turn:, p2_turn:)
    @players_turn_arr = [p1_turn, p2_turn]
  end

  private

  def current_turn
    @players_turn_arr.index(true)
  end

  public

  def print_current_turn(p1_name, p2_name)
    puts "#{[p1_name, p2_name].at(current_turn)}'S TURN".colorize(background: :blue)
  end

  def current_player_mark(p1_mark, p2_mark)
    [p1_mark, p2_mark].at(current_turn)
  end

  def next_turn
    @players_turn_arr.map!(&:!)
  end
end
