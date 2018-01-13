# O(N) # O(1)

# WIP

def reverse_words_in_a_string(string)
  left = 0
  right = characters.length - 1

  while left < right
    temp = string[left]
    string[left] = string[right]
    string[right] = temp
    # string[left], string[right] = string[right], string[right]
    left += 1
    right -= 1
  end
end

p reverse_words_in_a_string('hello')
