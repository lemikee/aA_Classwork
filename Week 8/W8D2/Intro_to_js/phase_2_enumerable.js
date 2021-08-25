// Array#myEach(callback)

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

let nums = [1, 2, 3, 4, 5];

// nums.myEach (el => {
//   console.log(el * 2);
// });

// nums.myEach (function (el) {
//   console.log(el * 2);
// });

// myEach = function (takes in some callback)

// syntax for taking in the callback is nums.myeach (
//   we see on line 12 that this callback function needs an element as an arg, so that's what we pass in
// )

// Array#myMap(callback)

Array.prototype.myMap = function (callback) {
  let mapped = [];

  for (let i = 0; i < this.length; i++) {
    mapped.push(callback(this[i]));
  }

  // console.log(mapped);
  return mapped;
}

  // console.log(nums.myMap(el => el * 2)); // implicit return no { }, simple code, one liner

  // nums.myMap(el => {
  //   return console.log(el * 2); // have to explicitly return, just like a normal function needs to have a return value
  // })

// Array#myReduce(callback[, initialValue])
// check if default value is null, if not set it
// take off first value
// call myEach on the array
// take in a call back pass in the same thing

Array.prototype.myReduce = function (callback, defaultValue= null) {
  let arr = this;
  if (defaultValue === null) {
    defaultValue = arr.shift();
  }

  let result = defaultValue

  arr.myEach(el => {
    result = callback(result, el) 
  })
  return result

}

// console.log([1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }));

// console.log([1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }, 25))
