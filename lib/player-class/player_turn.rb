# switch to next player turn and check who's turn it is
class PlayerTurn < Player
  def self.load_players(player_one, player_two)
    @players_arr = [player_one, player_two]
  end

  def self.print_current_turn
    puts "#{PlayerTurn.current_turn.name}'S TURN"
  end

  def self.current_turn
    @players_arr.select(&:turn)[0]
  end
end
