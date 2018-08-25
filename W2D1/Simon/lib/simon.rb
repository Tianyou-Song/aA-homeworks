require 'byebug'

class Simon

  def self.quick_play
    Simon.new.play
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  private

  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    system("clear")
    add_random_color
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
    nil
  end

  def require_sequence
    puts "Please enter sequence"
    input_seq = []
    i = 0
    while i < @sequence_length
      input_seq << parse_input_color
      unless @seq[0...input_seq.length] == input_seq
        @game_over = true
        break
      end
      i += 1
    end
  end

  def parse_input_color
    color_hsh = {
      r: "red",
      b: "blue",
      g: "green",
      y: "yellow"
    }
    begin
      input_color = color_hsh[gets[0].downcase.to_sym]
      raise IOError if input_color.nil?
    rescue
      puts "That's not a valid color!"
      retry
    end
    input_color
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round Success!"
  end

  def game_over_message
    puts "Game Over. Final sequence length: #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
    nil
  end
end
