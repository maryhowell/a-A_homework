Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (var i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        var temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        sorted = false;
      }
    }
  }

  return this;
};

// console.log([5, 3, 4, 2, 1].bubbleSort());


String.prototype.subString = function() {
  let string = this + "x";

  let storage = [];

  for (var i = 0; i < string.length; i++) {
    for (var j = i + 1; j < string.length; j++) {
      storage.push(string.slice(i, j));
    }
  }

  return storage;
};



//
//
console.log('cat'.subString());
//
//

// c ca cat a at t
