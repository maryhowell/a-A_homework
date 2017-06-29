Array.prototype.uniq = function() {
  let uniqArray = [];
    this.forEach(function (el) {
      if (!uniqArray.includes(el)){
        uniqArray.push(el);
      }
    });
// each over array if false push item to new array
 return uniqArray;
};

// console.log([1,2,3,3,4,5,6].uniq())


Array.prototype.twosum = function() {
  let twosumArray = [];

  for (var i = 0; i < this.length; i++) {
    for (var j = 0; j < this.length; j++) {
      if (this[i] + this[j] === 0){
        twosumArray.push([i, j]);
      }
    }
  }
  return twosumArray;
};

// console.log([1,2,3,-3,4,5,6].twosum())

Array.prototype.transpose = function() {
  let transposeArray = [];
  let pods = [];

  for (var i = 0; i < this.length - 1; i++) {
    this.forEach(function (el) {
      pods.push(el[i]);
    });
    transposeArray.push(pods);
    pods = [];
  }
  return transposeArray;
};

// console.log([[1,2], [3,4], [5,6]].transpose());
