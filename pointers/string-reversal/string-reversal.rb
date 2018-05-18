# Time: O(N)
# Space: O(1)

def reverse_words_in_a_string(string)
  left = 0
  right = string.length - 1

  while left < right
    temp = string[left]
    string[left] = string[right]
    string[right] = temp
    # string[left], string[right] = string[right], string[left]
    left += 1
    right -= 1
  end

  string
end

p reverse_words_in_a_string('hello')
