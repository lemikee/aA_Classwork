// const readline = require("readline");
// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function askIfGreaterThan(el1, el2, callback) {
      if (el1 > el2) {
        callback(true)
      } else {
        callback(false)
      }
};

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i === (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
  }
  // debugger
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], function(isGreaterThan) {
      if (isGreaterThan) {
        [arr[i], arr[i+1]] = [arr[i +1], arr[i]];

        madeAnySwaps = true;
      }

      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  outerBubbleSortLoop(true)

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

absurdBubbleSort([3, 2, 1,5,9,7,5,10], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
});