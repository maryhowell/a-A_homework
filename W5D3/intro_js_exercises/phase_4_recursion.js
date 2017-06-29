 function range (start, end) {
  if (start === end){
    return [];}
  let makeRange = [];
    for (var i = start; i <= end; i++) {
      makeRange.push(i);
    }
  return makeRange;
}

// console.log(`range(3, 10) = ${range(3, 10)}`);

function sumRec(numbers) {
  if (numbers.length === 0) {
    return 0;
  }
  return (numbers.shift() + sumRec(numbers));
  }


// console.log(`sumRec([1, 3, 5]) = ${sumRec([1, 3, 5])}`);

// console.log([1,2,3,4,5,6].slice(2));

function exp1(base, exp) {
  if (exp === 0 ) {
    return 1;
  }
  return (base * exp1(base, exp - 1));

}

function exp2(b, n) {
  if (n === 0 ) {
    return 1;
  }
  if (n % 2 === 0) {
    return Math.pow(exp2(b, n / 2), 2);
  } else {
    return b * Math.pow((exp2(b, (n - 1) / 2)), 2);
  }
}


console.log(`exp2(2, 4) = ${exp2(2, 4)}`);

// function fibbys(n) {
//   if (n === 1) {
//     return [0];
//   }
//   if (n === 2) {
//     return [0, 1];
//   }
//
//   let n === [0, 1]
//
// }

console.log([1,2,3].slice(-2).reduce())
