# Wrapper for the tty-prompt gem and its methods
class TTYWrapper
  def initialize
    @prompt = TTY::Prompt.new
  end

  def yes?(question:)
    @prompt.yes?(question)
  end

  def select(question:, choices:)
    @prompt.select(question, choices)
  end
end
