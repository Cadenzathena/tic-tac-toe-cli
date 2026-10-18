# The Player class handles which player's turn it is
class Player
  attr_reader :name, :mark, :player_one, :player_two
  attr_accessor :turn

  def initialize(name:, mark:, turn:)
    @name = name
    @mark = mark
    @turn = turn
  end

  def self.get_players(player_one, player_two)
    @players_arr = [player_one, player_two]
  end

  def self.current_turn
    @players_arr.select(&:turn)
  end

  def self.log_current_turn
    result = Player.current_turn
    puts "#{result.map(&:name).join}'S TURN"
  end

  def self.next_turn
    @players_arr.map do |element|
      element.turn = !element.turn
      element
    end
  end
end
