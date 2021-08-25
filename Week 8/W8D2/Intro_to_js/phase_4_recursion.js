// range

function range(start, end) {
  if (start === end) {
    return [end];
  }

  let arr = [start];

  result = arr.concat(range(start + 1, end));

  return result;
}

// console.log(range(1, 10));

//sumRec(arr)

function sumRec(array) {
  if (array.length === 0){
    return 0
  }
  let sum = array.shift()
  let result = sum + sumRec(array)
  return result;
}

// console.log(sumRec([1,2,3,4,5]))