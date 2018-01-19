// return true or false if able to reach the last index
// https://leetcode.com/problems/jump-game/solution/

// Iterative

// function canJump(nums) {
//   var finalIndex = nums.length - 1;
//   var needToReach = nums.length - 1;
//
//   // position set to start comparing the second to last element
//   for (var position = finalIndex- 1; position >= 0; position--) {
//     var value = nums[position];
//     if ((value + position) >= needToReach) {
//       needToReach = position;
//     }
//   }
//
//   return needToReach === 0 ? true : false;
// }
//
// console.log(jump([1,2,3,2,3,0,0,1]) == true);
// console.log(jump([1,2,3,2,3,0,0,0,0]) == false);

// Recursive traversal

function canJump(nums) {
  var needToReach = nums.length - 1;
  var position = needToReach - 1;
  // starting from the second to last
  var jumpTest = canJumpHelper(nums, needToReach, position)
  return jumpTest;
}

function canJumpHelper(nums, needToReach, position) {
  // logic updating passed in data
  var value = nums[position];
  if ((value + position) >= needToReach) {
    needToReach = position;
  }

  // break condition after iterating through all array elements in reverse
  if (position === 0) {
    return needToReach === 0 ? true : false;
  }

  // n - 1 recursive call
  return canJumpHelper(nums, needToReach, position - 1)
}

console.log(canJump([1,0]) === true);
console.log(canJump([0,0]) === false);
console.log(canJump([1,2]) === true);
console.log(canJump([1,2,3]) == true);
// console.log(canJump([1,2,3]) === true);
// console.log(canJump([1,2,3,2,3,0,0,1]) == true);
// console.log(jump([1,2,3,2,3,0,0,0,0]) == false);
