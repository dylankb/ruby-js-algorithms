# https://leetcode.com/problems/jump-game/

# Approach 1: Top down recursive solution

def can_jump(array)
  can_jump_helper(array, array.size-1)
end

def can_jump_helper(array, last_index)
  # base case - index has successfully backtracked to the beginning position
  return true if last_index == 0

  (0..last_index - 1).each do |i|
    if (array[i] + i >= last_index)
      if can_jump_helper(array, last_index - 1)
        return true
      end
    end
  end
  return false
end

# Approach 2: Top down dynamic programming solution

def can_jump(array)
  can_jump_helper(array, array.size-1, {})
end

def can_jump_helper(array, last_index, cache)
  # base case - index has successfully backtracked to the beginning position
  return true if last_index == 0

  (0..last_index - 1).each do |i|
    if (array[i] + i >= last_index)
      if cache[i] || can_jump_helper(array, i, cache)
        cache[i] = true
        return true
      end
    end
    cache[i] = false
  end
  return false
end

p can_jump([2,0,1,3,0]) == true
p can_jump([2,0,1,1,0]) == true
p can_jump([2,0,1,0,0]) == false
