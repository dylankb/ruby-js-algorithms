// https://leetcode.com/problems/move-zeroes/description/
// [0, 1, 0, 3, 12], => [1, 3, 12, 0, 0].

// Splice and append:
// Remove each encountered zero and append it to the end of the array

// Time: O(N^2)?
// Space: O(1)

// The time complexity is a bit high here because at worst, we have to splice our array at worst N times displacing N items in the array each time.

function moveZeros(numbers) {
  let currentIndex = 0;
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[currentIndex] === 0) {
      const zero = numbers.splice(currentIndex, 1);
      numbers.push(zero[0]);
    } else {
      currentIndex += 1;
    }
  }

  return numbers;
}

console.log(moveZeros([0, 1, 0, 3, 12])); // [1, 3, 12, 0, 0]

// Pointer - trailing switch:
// While iterating through the numbers, if you encounter a non zero integer switch it with the first zero integer encountered

// [ 0, 1, 2, 8 ]
// currentIndex 0
// firstZeroIndex 0
// [ 0, 1, 2, 8 ]
// currentIndex 1
// firstZeroIndex 0
// [ 1, 0, 2, 8 ]
// currentIndex 2
// firstZeroIndex 1
// [ 1, 2, 0, 8 ]
// currentIndex 3
// firstZeroIndex 2
// [ 1, 2, 8, 0 ]

// Time: O(N)
// Space: O(1)

function moveZerosWithPointers(numbers) {
  let currentIndex = 0;
  let firstZeroIndex = 0;

  while (currentIndex < numbers.length) {
    if (numbers[currentIndex] != 0) {
      // perform switch
      let temp = numbers[currentIndex];
      numbers[currentIndex] = numbers[firstZeroIndex]
      numbers[firstZeroIndex] = temp
      firstZeroIndex += 1;
    }
    currentIndex += 1;
  }

  return numbers
}

module.exports = moveZerosWithPointers
