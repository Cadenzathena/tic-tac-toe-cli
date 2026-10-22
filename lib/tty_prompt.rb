# Wrapper for the tty-prompt gem and its methods
class TTYWrapper
  def initialize
    @prompt = TTY::Prompt.new
  end

  def select_move(question:, choices:)
    @prompt.select(question, choices)
  end
end
