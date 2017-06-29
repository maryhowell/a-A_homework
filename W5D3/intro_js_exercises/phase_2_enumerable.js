const NUMS = [1, 2, 3, 4, 5];

Array.prototype.myEach = function(callback) {
  for (var i = 0; i < this.length - 1; i++) {
    callback(this[i]);
  }
};

// NUMS.myEach((num) => {
//   console.log(`square of ${num} is ${num * num}`);
// });


Array.prototype.myMap = function(callback) {
  let mapped = [];
  for (var i = 0; i < this.length - 1; i++) {
    mapped.push(callback(this[i]));
  }
  return mapped;
};

// console.log(NUMS.myMap( num => num * num ));


Array.prototype.myReduce = function(acc, initialValue) {

  if (!initialValue) {
    initialValue = this[0];
    arr = this.slice(1);
  }
  let result = initialValue;

  arr.myEach(el => result = acc(result, el));

  return result;

};

console.log(NUMS.myReduce( (total, item) => total + item ));
// // without initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }); // => 6
//
// // with initialValue
// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25); // => 31
