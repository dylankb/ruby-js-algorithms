# https://leetcode.com/problems/simplify-path/description/
require_relative '../../utils/stack'

def simplify_path(path)
  return '/' if path =~ /\//

  stack = Stack.new
  path_segments = path.split('/')

  path_segments.each do |path_segment|
    if path =~ /\w/
      stack.push('/' + path_segment)
    elsif path == '..'
      stack.pop()
    else
      next
    end
  end

  simplified_path = ''
  while !stack.peek.nil?
    simplified_path += stack.pop.data
  end

  simplified_path
end

p simplify_path("/") == "/"
# p simplify_path("/home/") == "/home"
# p simplify_path("/a/./b/../../c/") == "/c"
