# https://leetcode.com/problems/valid-parentheses/description/

# Algorithm

# Check if the character is an opening paren. If it is, push to to the stack
# If it's a closing paren
#   - Check for it's matching open paren type on the stack top
#   - Pop that element off the stack

require_relative '../../utils/node'
require_relative '../../utils/stack'

def valid_parens?(string)
  stack = Stack.new
  paren_list = ['{', '}', '(', ')', '[', ']']
  paren_dict = create_dictionary(paren_list)
  string.split('').each do |character|
    if opening_paren?(paren_dict, character)      # { "{" : ... }
      stack.push(character)
    elsif closing_paren?(paren_dict, character)   # { ... : "}" }
      return false unless matching_paren_on_stack?(character, stack, paren_dict)
      stack.pop
    else
      next
    end
  end

  return true if stack.empty?
  false
end

def opening_paren?(paren_dict, character)
  paren_dict.has_key?(character)
end

def closing_paren?(paren_dict, character)
  paren_dict.has_value?(character)
end

def matching_paren_on_stack?(character, stack, paren_dict)
  return false if stack.empty? || paren_dict[stack.peek.data] != character
  true
end

def create_dictionary(list)
  dictionary = {}
  list.each_slice(2) do |opener, closer|
    dictionary[opener] = closer
  end

  dictionary
end

p valid_parens?('[') == false
p valid_parens?('()') == true
p valid_parens?('}{') == false
p valid_parens?('(){}') == true
p valid_parens?('(()(){})') == true
p valid_parens?('()(){})') == false
p valid_parens?('( {}) ()') == true
p valid_parens?('( {}) () )') == false
p valid_parens?('( ({}) () )') == true

# Example walkthrough

#        List            current Stack       Dict
# ["{", "}", "(", ")"]     nil   []       { "{" : "}", ... }
# ["{", "}", "(", ")"]      {    ["{"]    ...
# ["{", "}", "(", ")"]      }    ["{"]    ...
# => "Match"
# Stack.pop
# ["{", "}", "(", ")"]      (    ["("]    ...

# Note: Popping elements off the stack
# It might not seem immediatley necessary in these examples, but it's actually an
# important component once you start getting into more complicated examples where
# there's multiple opening parentheses.

#        List            current Stack       Dict
# ["{", "(", "}", "}"]     nil   []          { "{" : "}", ... }
# ["{", "(", "}", "}"]     {    ["{"]        ...
# ["{", "(", "}", "}"]     (    ["{", "("]   ...
# ["{", "(", ")", "}"]     )    ["{", "("]   ...
# => "Match"
# Stack.pop
# ["{", "(", ")", "}"]     }    ["{",]   ...
# ...

# Further exploration

# If you wanted to create an even more optimal solution AND you were only dealing with
# one type of solution, apparently you could use store numbers to represent how many
# each paren type would be stored.
