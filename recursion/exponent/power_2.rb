# Solution 4: Negative & positive powers recursive solution

# Runtime - O(log(n))
# Space - O(log(n))

def power(base, exponent)
  if exponent == 0
    return 1
  elsif (exponent < 0)
    positive_exponent = -1 * exponent
    return 1.0 / power(base, positive_exponent);
  elsif exponent % 2 == 0
    half = power(base, exponent / 2)
    return half * half
  else
    half = power(base, exponent / 2)
    return base * half * half
  end
end

p power(2,-2)

# Solution 3: More efficient solution - positive numbers

# By only making recursive calls for the exponent / 2, we can halve the size of
# our call stack.

# Runtime - O(log(n)): For every n in 1..exponent, we perform n/2
# computations.

# Size - O(log(n)): Only log(n) number of stacks required at any one time

def power(base, exponent)
  if exponent == 0
    return 1
  elsif exponent % 2 == 0
    half = power(base, exponent / 2)
    return half * half
  else
    half = power(base, exponent / 2)
    return base * half * half
  end
end

p power(2,-2)

# Solution 2: Simplest solution - positive numbers

# This is perhaps the most straight-forward way to solve power problem using
# recursion.

def power(base, exponent)
  if exponent == 0
    return 1
  else
    base * power(base, exponent - 1)
  end
end

p power(2,-2)

exponent|recursive call               |return value
--------|-----------------------------|------------
0       |                             | 1
1       |2 * power(2, (1-1)) => 2 * 1 | 2
1       |2 * power(2, (2-1)) => 2 * 2 | 4
2       |2 * power(2, (2-1)) => 2 * 4 | 8

# Runtime - O(n): Cost of exponent(exponent - 1) + Base case( 0(1)) returns
# O(exponent)
# https://cs.muic.mahidol.ac.th/courses/ds/lects/lect03.pdf

# Size - O(n): Only n number of stacks required at any one time.

# Solution 1: Simple iterative solution

def power(base, exponent)
  result = 1.0
  if exponent > 0
    exponent.times do |_|
      result *= base
    end
  else
    (-1 * exponent).times do |_|
      result /= base
    end
  end

  result
end

# Negative powers:

# 1) Dealing with negativity: One of the easiest ways to deal with a negative
#    exponent is to make it positive and have it divided by 1.
# 2) Dealing with floats. If we want to find 2^-2, then our algorithm will run
#    1/4 as its final operation. In Ruby this will return 0, but the answer we're
#    looking for is 0.25. Therefore using 1.0 ensures we'll return a float in
#    our division

# Runtime - O(n): Cost of exponent(exponent - 1) + Base case( 0(1)) returns
# O(exponent)
# https://cs.muic.mahidol.ac.th/courses/ds/lects/lect03.pdf

# Size - O(n): Only n number of stacks required at any one time.
