def word_break(string, dictionary)
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
      suffix = string[i+1..string.size]
      return true if word_break_helper(dictionary, suffix)
    end
  end

  return false
end

p word_break("aaaaaaa", ["aaaa","aa"]) == false # false positive

p word_break('helloo', ['he', 'll', 'oo']) == true
p word_break('helloo', ['he','lp','oo']) == false # false positive
p word_break('helloo', ['he','lpoo']) == false
p word_break('helloo', ['he', 'l', 'oo']) == false # falise positive
# p word_break(['be', 'l', 'oo'], 'helloo')
# p word_break(['he'], 'helloo')
