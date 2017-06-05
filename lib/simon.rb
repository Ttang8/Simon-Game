class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @guess
  end

  def play
    system "clear"
    puts "Welcome to Simon!"
    puts "To play, type in the correct color combination"
    puts "as they appear."
    puts "Color combinations will stay up for 4 seconds."
    puts "combo example: red red blue"
    puts "input example: red red blue"
    puts "Have fun!"
    puts "Press Enter to continue and play!"
    gets
    until game_over
      take_turn
    end
    game_over_message
    reset_game
    sleep (5)
    system "clear"
    play
  end

  def take_turn
    system "clear"
    show_sequence
    require_sequence
    if @seq == @guess
      round_success_message
      @sequence_length += 1
      sleep (2)
    else
      @game_over = true
    end
  end

  def show_sequence
    puts "Simon's combo:"
    puts add_random_color
    sleep (4)
    system "clear"
  end

  def require_sequence
    puts "Enter combo!"
    input = gets.chomp
    @guess = input.split
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You got the right combo!"
  end

  def game_over_message
    puts "Aww. Game Over!"
    puts "You survived for #{@sequence_length} turns!"
    if sequence_length < 5
      puts "Thats pretty bad"
    else
      puts "Not too bad! See how high you can get!"
    end
    puts "Play Again"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
