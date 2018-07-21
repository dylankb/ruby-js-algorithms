// https://www.khanacademy.org/computing/computer-science/algorithms/recursive-algorithms/a/computing-powers-of-a-number
// Divide and Conquer Example

var power = function(x, n) {
    // base case
    if (n === 0) { return 1; }
    // recursive case: n is negative
    if (n < 0) { return 1 / power(x, -1 * n); }
    // recursive case: n is odd
    if (n % 2 != 0) { return x * power(x, n - 1); }
    // recursive case: n is even
    // more efficient version
    if (n % 2 === 0) {
        sum = power(x, n / 2);
        return sum * sum
    }
};

// Tail recursion example

let power = (base, power_of, acc=base) => {
  if (power_of === 0) {
    return 1
  } else if (power_of === 1) {
    return acc
  } else {
    return power(base, power_of - 1, base * acc);
  }
}

console.log(power(3, 0)); // 1
console.log(power(3, 1)); // 3
console.log(power(3, 2)); // 9
console.log(power(3, 3)); // 27
// console.log(power(2, -2)); // Maximum stack trace
