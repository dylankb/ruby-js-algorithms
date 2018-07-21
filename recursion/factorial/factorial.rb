def factorial(num)
  if num.zero?
    1
  else
    factorial(num - 1) * num
  end
end

# Say you wanted to cache the result, you could do something like this

def factorial(num, helper = {})
  if num.zero?
    helper[num] = 1
  else
    factorial(num - 1, helper)
    helper[num] = helper[num - 1] * num
  end

  helper
end

p factorial(4)[4] # 24
factorial         # {1=>1, 2=>2, 3=>6, 4=>24}

# But this isn't the most memory efficient algorithm in the world - we have O(N) space
# due to the hash plus O(N) because we're maintaining a call stack.

# Here's an arguably more clever version.

factorial = Hash.new do |h,k|
  if k > 1
    h[k] = h[k-1] * k
  else
    h[k] = 1
  end
end

factorial[4] # 24
factorial    # {1=>1, 2=>2, 3=>6, 4=>24}

# http://blog.honeybadger.io/advanced-ruby-hash-techniques/

# This works because each time a hash value is accessed without a value, for example
# the first itme h[k-1] * k is called when h[3] turns up nothing Hash.new is called
# again.
