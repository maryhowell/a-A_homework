const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  reader.question(
    // Prompt user to tell us whether el1 > el2; pass true back to the
    "Is " + el1 + " greater than " + el2 + "?: ",
    function (answer) {
      // callback if true; else false.
      if (answer == "yes") {
        callback(true);
      } else {
        callback(false);
      }
    }
  );
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  // Do an "async loop":
// 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
//    know whether any swap was made.
  if (i == (arr.length - 1)) {
    // End of array reached.
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
// 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +

  askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
    if (isGreaterThan) {
      const tmp = arr[i];
      arr[i] = arr[i + 1];
      arr[i + 1] = tmp;

      madeAnySwaps = true;
    }
//    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
//    continue the inner loop. You'll want to increment i for the
//    next call, and possibly switch madeAnySwaps if you did swap.


    innerBubbleSortLoop(
      arr, i + 1, madeAnySwaps, outerBubbleSortLoop
    );
  });
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if `madeAnySwaps` is true, else call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
