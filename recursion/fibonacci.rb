# Recursion - calculating the nth Fibonacci number

def fibonacci(num)
  return num if num < 2

  return fibonacci(num-1) + fibonacci(num-2)
end

p fibonacci(2)

# Basic iteration - very naive

def fibonacci(num)
  fibs = []
  (0..num).each do |i|
    if i < 2
      fibs.push(i)
    else
      fibs.push(fibs[i-1] + fibs[i-2])
    end
  end
  fibs[num]
end

p fibonacci(3)
