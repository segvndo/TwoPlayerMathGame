require_relative "./player"
require_relative "./game_qs"

class GamePlay
  attr_reader :of_round, :current_player
  attr_accessor :question

  def initialize
    @players = []
    @of_round = 0
    @current_player = nil
    @question = nil
  end

  #game starts and loops through rounds until one player loses all lives
  def start_game
    puts "Welcome to the Math Game!"

    print "Player 1, please enter your name: "

    player1 = Player.new(gets.chomp)
    @players << player1

    print "Player 2, please enter your name: "

    player2 = Player.new(gets.chomp)
    @players << player2

    puts "Hello #{player1.name} and #{player2.name}! Let's get started!\n\n"

    @current_player = @players[rand(0..1)]
    puts "The first player is #{current_player.name}!"

    while (@current_player.lives > 0)
      new_round
    end

    end_game
  end

  def increment_round
    @of_round += 1
  end

  # checks if the current player is not equal to the @current_player(find the next player in the array who is different from the current player)
  def switch_player
    @current_player = @players.find { |player| player != @current_player }
  end

  def end_game
    puts "Game over!"
    puts "#{current_player.name} wins with #{current_player.lives} lives remaining!"
    puts "Congratulations!"
  end

  def new_round
    increment_round

    puts "----- Round #{of_round} -----"

    game = Game.new

    puts "#{current_player.name}'s turn!"

    puts game.print_question

    # print "> "

    answer = gets.chomp.to_i

    if game.answer?(answer)
      puts "Correct!"
    else
      puts "Incorrect!"
      current_player.lose_life
    end

    puts "#{current_player.name} has #{current_player.lives} lives remaining!"

    switch_player
  end
end