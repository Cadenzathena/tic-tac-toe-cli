# switch to next player turn and check who's turn it is
class PlayerTurn
  def self.load_players(player_one, player_two)
    @players_arr = [player_one, player_two]
  end

  def self.current_turn
    @players_arr.select(&:turn)[0]
  end

  private_class_method :current_turn

  def self.print_current_turn
    puts "#{current_turn.name}'S TURN"
  end

  def self.current_turn_mark
    current_turn.mark
  end
end
