// https://www.khanacademy.org/computing/computer-science/algorithms/recursive-algorithms/p/challenge-is-a-string-a-palindrome

// O(N) / O (N^2) space complexity

// // Returns the first character of the string str
var firstCharacter = function(str) {
    return str.slice(0, 1);
};
//
// // Returns the last character of a string str
var lastCharacter = function(str) {
    return str.slice(-1);
};

// Returns the string that results from removing the first
//  and last characters from str
var middleCharacters = function(str) {
    return str.slice(1, -1);
};
//
var isPalindrome = function(str) {
    // base case #1
    if (str.length === 0) { return true; }
    // base case #2
    if (str.length === 1) { return true; }
    // recursive case
    if (firstCharacter(str) === lastCharacter(str)) {
        return true;
    } else {
        return false;
    }
    return isPalindrome(middleCharacters(str));
};

// 2. Passing new modified string

// Time - O(N) Time / O(N^2) Space Complexity
// https://codereview.stackexchange.com/a/55023

// function isPalindrome(string) {
//   return isPalindromeHelper(string, 0, string.length - 1)
// }
//
// function isPalindromHelper(string, start, end) { // returns boolean
//     if (string.length < 2) { return true; }
//
//     if (string[start] === string[end]) {
//       isPalindromeHelper(string.slice(start + 1, end - 1));
//       return true;
//     } else {
//       return false;
//     }
// }
//
// console.log((isPalindrome("a") === true));
// console.log((isPalindrome("motor") === false));
// console.log((isPalindrome("rotor") === true));
// console.log((isPalindrome("hannah") === true));
// console.log((isPalindrome("tac o cat") === true));

// 3. Passing new modified string - Single return

function isPalindrome(string) {
  return isPalindromeHelper(string, 0, string.length - 1)
}

function isPalindromHelper(string, start, end) { // returns boolean
  if (string.length < 2) { return true; }

  return string[start] === string[end] && isPalindrome(string.slice(start + 1, end - 1))
}

console.log((isPalindrome("a") === true));
console.log((isPalindrome("motor") === false));
console.log((isPalindrome("rotor") === true));
console.log((isPalindrome("hannah") === true));
console.log((isPalindrome("tac o cat") === true));

// 4. Passing pointers (indices) solution - O (N) / O(N)

function isPalindrome(string) {
  return palindrome_helper(string, 0, string.length - 1)
}

function palindrome_helper(string, start, end) {
  if (end - start < 2) { return true; }

  return (string[start] === string[end]) && palindrome_helper(string, start+1, end-1)
}

console.log((isPalindrome("a") === true));
console.log((isPalindrome("motor") === false));
console.log((isPalindrome("rotor") === true));
console.log((isPalindrome("hannah") === true));
console.log((isPalindrome("tac o cat") === true));
