const moveZeros = require('./moveZeros');

test('deals with leading zeros', () => {
  expect(moveZeros([0,1,1])).toEqual([1,1,0]);
});

test('deals with leading zeros', () => {
  expect(moveZeros([1,0,0,1,0])).toEqual([1,1,0,0,0]);
});
