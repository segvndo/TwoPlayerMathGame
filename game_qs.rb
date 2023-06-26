class Game

  attr_reader :correct_answer

  def initialize
    @first_number = rand(1..20).to_i
    @second_number = rand(1..20).to_i
    @correct_answer = @first_number + @second_number
  end

  def print_question
    "What does #{@first_number} plus #{@second_number} equal?"
  end

  def answer?(answer)
    answer == @correct_answer
  end
end