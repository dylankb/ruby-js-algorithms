# For any given amount, what are the minimum amount of coins I need
# to create that amount given a certain amount of coins

def coin_change(coins, sum)
  coin_change_helper(coins, sum, {})
end

def coin_change_helper(sum, coins, coins_required)
  return 0 if sum == 0;

  # use previously calculated value if it exists
  if coins_required.has_key?(sum)
    return coins_required[sum]
  end

  minimum_coins_used = Float::INFINITY

  coins.each do |coin|
    next if coin > sum

    coins_used = coin_change_helper(sum - coin, coins, coins_required)

    if coins_used < minimum_coins_used
      minimum_coins_used = coins_used
    end
  end

  if minimum_coins_used == Float::INFINITY
    minimum_coins_used
  else
    minimum_coins_used = minimum_coins_used + 1
  end

  coins_required[sum] = minimum_coins_used
  minimum_coins_used
end

# p coin_change(1, [2, 1])
# p coin_change(2, [1, 2])
p coin_change(0, [1])
# p coin_change(4, [1, 2, 3])
# p coin_change(27, [25, 10, 5, 1])
# p coin_change(680_999, [25, 10, 5, 1]) # stack overflow
# p coin_change(4, [1, 2, 3])
