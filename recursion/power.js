// https://www.khanacademy.org/computing/computer-science/algorithms/recursive-algorithms/a/computing-powers-of-a-number

var power = function(x, n) {
    // base case
    if (n === 0) { return 1; }
    // recursive case: n is negative
    if (n < 0) { return 1 / power(x, -1 * n); }
    // recursive case: n is odd
    if (isOdd(n)) { return x * power(x, n - 1); }
    // recursive case: n is even
    if (isEven(n)) {
        return power(x, n / 2) * power(x, n / 2);
    }
};

console.log(power(3, 0)); // 1
console.log(power(3, 1)); // 3
console.log(power(3, 2)); // 3
console.log(power(3, 3)); // 3
