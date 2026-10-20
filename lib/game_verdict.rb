# determines the final verdict of the game
class GameVerdict
  def check_game_verdict(played_moves_array)
    check_rows(played_moves_array)
    check_columns(played_moves_array)
    check_left_diagonal(played_moves_array)
    check_right_diagonal(played_moves_array)
    final_judgement
  end

  private

  def check_rows(played_moves_array)
    played_moves_array.each do |hash|
      next unless hash.values.uniq.length == 1

      @verdict = "win"
      @mark = hash.values.uniq.join
    end
  end

  def check_columns(played_moves_array)
    i = 0
    3.times do
      column = played_moves_array.map { |hash| hash.values[i] || next }
      if column.uniq.length == 1
        @verdict = "win"
        @mark = column.uniq.join
        break
      end
      i += 1
    end
  end

  def check_left_diagonal(played_moves_array)
    i = -1
    diagonal = played_moves_array.map do |hash|
      i += 1
      hash.values[i]
    end
    return unless diagonal.uniq.length == 1

    @verdict = "win"
    @mark = diagonal.uniq.join
  end

  def check_right_diagonal(played_moves_array)
    i = 0
    diagonal = played_moves_array.map do |hash|
      i -= 1
      hash.values[i]
    end
    return unless diagonal.uniq.length == 1

    @verdict = "win"
    @mark = diagonal.uniq.join
  end

  def final_judgement
    if @verdict == "win" # rubocop:disable Style/GuardClause
      case @mark
      when "X"
        puts "PLAYER 1 WINS!"
        @verdict
      when "O"
        puts "PLAYER 2 WINS!"
        @verdict
      end
    # else
    #   puts "WHAT A DRAW!" # rubocop:disable Layout/CommentIndentation
    end
  end
end
