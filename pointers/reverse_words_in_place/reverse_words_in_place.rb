# Stack/flush array approach

# Time: O(N^2)?
# Space: O(N)

def reverse_words(str)
  # Go for it
  stack = []
  reversed_string = ""
  index_tracker = { current: 0 }
  final_index = str.length - 1

  while index_tracker[:current] <= final_index
    reverse_word(index_tracker, str, stack, final_index)
    add_to_string(reversed_string, stack)
    move_to_next_word(index_tracker, stack, reversed_string)
  end

  reversed_string.chomp
end

def reverse_word(index_tracker, str, stack, final_index)
  while str[index_tracker[:current]] != " " && index_tracker[:current] <= final_index
    stack.unshift(str[index_tracker[:current]])
    index_tracker[:current] += 1
  end
end

def add_to_string(reversed_string, stack)
  reversed_string << stack.join('')
end

def move_to_next_word(index_tracker, stack, reversed_string)
  index_tracker[:current] += 1 # to skip the blank space
  # use destructive methods to modify passed in references
  reversed_string << ' '
  stack.clear
end

puts reverse_words("Hello World")

# Standard library one liners

def reverse_words(str)
  reversed_array = string.split.map(&:reverse).join('')
end

def reverse_words(str)
  str.split.reverse.join(" ").reverse
end
