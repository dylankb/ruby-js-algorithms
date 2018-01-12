// https://leetcode.com/problems/move-zeroes/description/
// [0, 1, 0, 3, 12], => [1, 3, 12, 0, 0].

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
