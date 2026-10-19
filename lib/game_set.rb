class GameSet
  attr_reader :win

  def initialize
    @win = nil
  end

  def check_game_result(game_record)
    if @win == true
      puts "win!"
    elsif @win == false
      puts "draw!"
    end
    move_registry = game_record.move_registry
    GameSet.check_registry_rows(move_registry)
    # GameSet.check_registry_columns(move_registry)
    # GameSet.check_registry_diagonals(move_registry)
  end

  def self.check_registry_rows(move_registry)
    move_registry.each do |element|
      row_inspect_hash = element.values.reduce(Hash.new(0)) do |result, value| # rubocop:disable Style/EachWithObject
        result[value] += 1
        result
      end
      row_inspect_hash.length == 1 ? GameSet.which_player_won(row_inspect_hash.values[0]) : next
    end
  end

  def self.which_player_won(key)
    if key == "X"
      puts "yay!"
    else
      puts "wow this sucks..."
    end
  end
end
