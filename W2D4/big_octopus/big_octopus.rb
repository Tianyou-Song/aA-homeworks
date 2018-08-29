# Big O-ctopus and Biggest Fish
# A Very Hungry Octopus wants to eat the longest fish in an array of fish.
#
# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(fishes)
  biggest = ""
  i = 0
  while i < fishes.count - 1
    biggest_sub = fishes[i]
    j = i + 1
    while j < fishes.count
      biggest_sub = fishes[j] if fishes[j].length > fishes[i].length
      j += 1
    end
    biggest = biggest_sub if biggest_sub.length > biggest.length
    i += 1
  end
  biggest
end

#
# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that runs in O(n log n) in the Sorting Demo. Remember that Big O is classified by the dominant term.
def donimant_octopus(fishes)
  fishes.sort[-1]
end

#
# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish that you have found so far while stepping through the array only once.
def clever_octopus(fishes)
  fishes.reduce do |biggest, fish|
    biggest.length > fish.length ? biggest : fish
  end
end

#
# Dancing Octopus
# Full of fish, the Octopus attempts Dance Dance Revolution. The game has tiles in the following directions:
#
# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# To play the game, the octopus must step on a tile with her corresponding tentacle. We can assume that the octopus's eight tentacles are numbered and correspond to the tile direction indices.
#
# Slow Dance
# Given a tile direction, iterate through a tiles array to return the tentacle number (tile index) the octopus must move. This should take O(n) time.
#
# slow_dance("up", tiles_array)
# > 0
#
# slow_dance("right-down", tiles_array)
# > 3

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, i|
    return i if direction == dir
  end
end

# Constant Dance!
# Now that the octopus is warmed up, let's help her dance faster. Use a different data structure and write a new function so that you can access the tentacle number in O(1) time.
#
# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3

directions_hsh = {
  "up" => 0,
  "right_up" => 1,
  "right" => 2,
  "right_down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def fast_dance(direction, directions_hsh)
  directions_hsh[direction]
end
