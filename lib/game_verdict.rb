# determines the final verdict of the game
class GameVerdict
  def check_win_verdict(played_moves_array)
    [
      check_row(played_moves_array),
      check_column(played_moves_array),
      check_left_diagonal(played_moves_array),
      check_right_diagonal(played_moves_array)
    ].each do |method|
      return method if method != ""
    end
  end

  private

  def check_row(played_moves_array)
    played_moves_array.filter_map do |hash|
      return hash.values.uniq.join if hash.values.uniq.length == 1
    end.join
  end

  def check_column(played_moves_array)
    3.times do |i|
      column = played_moves_array.map { |hash| hash.values[i] || next }
      return column.uniq.length == 1 ? column.uniq.join : ""
    end
  end

  def check_left_diagonal(played_moves_array)
    i = -1
    diagonal = played_moves_array.map do |hash|
      i += 1
      hash.values[i]
    end
    diagonal.uniq.length == 1 ? diagonal.uniq.join : ""
  end

  def check_right_diagonal(played_moves_array)
    i = 0
    diagonal = played_moves_array.map do |hash|
      i -= 1
      hash.values[i]
    end
    diagonal.uniq.length == 1 ? diagonal.uniq.join : ""
  end
end
