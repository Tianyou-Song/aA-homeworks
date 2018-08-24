# Exercise 1 - Stack
# Let's write a Stack class. To do this, use the following framework:
#
#   class Stack
#     def initialize
#       # create ivar to store stack here!
#     end
#
#     def push(el)
#       # adds an element to the stack
#     end
#
#     def pop
#       # removes one element from the stack
#     end
#
#     def peek
#       # returns, but doesn't remove, the top element in the stack
#     end
#   end
# To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!

class Stack
  def initialize
    @stack = Array.new
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack.last
  end
end
