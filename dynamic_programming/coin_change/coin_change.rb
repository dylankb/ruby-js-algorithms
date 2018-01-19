# coins = [25, 10, 5, 1]

# Will the largest coin equal the sum?
#
# - check above statement n times
# coin_change => coins[0] == sum
# coin_change => coins[1] == sum
# coin_change => coins[2] == sum
#
# or
#
# if coin_change => coins[0] >= sum
# - add coin
# - can repeat?
#   - if no
#     - coin_change => coins[1] > sum
#     - add coin
#     - can repeat?
#
#
#
# if less than sum
#
# coin_change => coins[0] * 2 == sum

def coin_change(coins, sum)
  used = {}
  coin_change_helper(coins, sum, 0, used)
end

def coin_change_helper(coins, sum, coin_index, used)
  return coin_index == coins.length;

  if coin_index
    return coins
  end

  coin_change_helper(coins, sum, coin_index + 1, used)
end

p coin_change([25, 10, 5, 1], 27)
