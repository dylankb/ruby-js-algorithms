# Can we find a matching word in the dictionary?
#
# Can we find a matching dictionary entry for first part of the word?
# Can we find a matching dictionary entry for second part of the word?
#
# word['word', 'dict'] / string =>
# word_break(string) && word_dict[0] == string
# word_break(string) && word_dict[1] == string
# word_break(string) && word_dict[2] == string
#
# length = string - 1
# #
# word_break(string) && word_dict[0] == string.slice(0, length - 1) && word_dict[1] == string.slice(length - 1, length)
# word_break(string) && word_dict[0] == string.slice(0, -2)
# word_break(string) && word_dict[0] == string.slice(0, -3)
#
# ... Many more combinations...


def word_break(dictionary, string)
  # returns boolean
  word_break_helper(dictionary, string)
end

def find_prefix(dictionary, prefix)
  result = dictionary.select { |entry| entry.start_with?(prefix)}
  !result.empty?
end

def word_break_helper(dictionary, string)
  return true if dictionary.include?(string)

  string.size.times do |i|
    prefix = string[0..i]
    if find_prefix(dictionary, prefix)
      suffix = string[i+1..string.size-i]
      return true if word_break_helper(dictionary, suffix)
    end
  end

  return false
end

p word_break(['he', 'll', 'oo'], 'helloo')
p word_break(['he','lp','oo'], 'helloo') # false positive
p word_break(['he', 'l', 'oo'], 'helloo') # falise positive
p word_break(['be', 'l', 'oo'], 'helloo')
p word_break(['he'], 'helloo')
