// https://www.khanacademy.org/computing/computer-science/algorithms/recursive-algorithms/a/computing-powers-of-a-number
// Divide and Conquer Example

var power = function(x, n) {
    // base case
    if (n === 0) { return 1; }
    // recursive case: n is negative
    if (n < 0) { return 1 / power(x, -1 * n); }
    // recursive case: n is odd
    if (isOdd(n)) { return x * power(x, n - 1); }
    // recursive case: n is even
    // more efficient version
    if (isEven(n)) {
        sum = power(x, n / 2);
        sum * sum
    }
};

// Tail recursion example

var power = (number, power_of, base_exponent=0, acc=1.0) => {
  if (base_exponent === power_of) {
    return acc
  }
  else if (power_of == acc) {
    return number
  } else {
    return number * power(number, power_of - 1);
  }
}

console.log(power(3, 0)); // 1
console.log(power(3, 1)); // 3
console.log(power(3, 2)); // 3
console.log(power(3, 3)); // 3
