// Array#bubbleSort

Array.prototype.bubbleSort = function () {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++){
            if (this[i] > this[i+1]){
                [this[i], this[i+1]] = [this[i+1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
}

let arr = [2,1,4,3,5]

// console.log(arr.bubbleSort())

// String#substrings

String.prototype.subStrings = function () {
  let arr = [];

  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i + 2; j < this.length; j++) {

      arr.push(this.slice(i, j));
    }
  }

  return arr;
}
let str = "taco bell"

console.log(str.subStrings())