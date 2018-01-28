# WIP

# def word_break(dictionary, word)
#   cache = {}
#   word.size.times do |index|
#     index-1.times do |inner_index|
#       if dictionary.include?(word[inner_index..index])
#         cache[inner_index] = word[inner_index..index]
#       end
#       cache[inner_index]
#     end
#   end
# end

def word_break(word, dictionary)
  cache = Array.new(word.length, false)
  cache[0] = true

  word.size.times do |index|
    index-1.times do |inner_index|
      if cache[inner_index] && dictionary.include?(word[inner_index..index])
        cache[index] = true
        break
      end
    end
  end
  cache[word.length]
end

p word_break('a', ['a'])
# p word_break(['helloo'], 'helloo') == true
# p word_break(['he', 'll', 'oo'], 'helloo') == true
# p word_break(['he','lp','oo'], 'helloo') == false # false positive
