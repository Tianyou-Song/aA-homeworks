require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    if start_pos.between?(0, @cups.count - 1)
      if @cups[start_pos].empty?
        raise "Starting cup is empty"
      else
        return true
      end
    else
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    hand = @cups[start_pos]
    @cups[start_pos] = []

    skip = nil
    if current_player_name == @name1
      skip = 13
    else
      skip = 6
    end

    i = start_pos
    until hand.empty?
      i += 1
      cup_pos = i % 14
      @cups[cup_pos] << hand.pop unless cup_pos == skip
    end
    render
    ending_cup_idx = i % 14
    next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left = @cups[0..5]
    right = @cups[7..12]
    all_empty?(left) || all_empty?(right)
  end

  def all_empty?(arr)
    arr.all? do |sub_arr|
      sub_arr.empty?
    end
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 0
      :draw
    when 1
      @name1
    when -1
      @name2
    end 
  end
end
