// Sum

// function part_1_sum() {
//     let sum = 0;

//     for (let i = 0; i < arguments.length; i++){
//         sum += arguments[i];
//     }

//     return sum;
// }

// console.log(part_1_sum(1, 2, 3, 4) === 10);
// console.log(part_1_sum(1, 2, 3, 4, 5) === 15);

function part_2_sum(...args) {
    let sum = 0;

    for (let i = 0; i < args.length; i++){
        sum += args[i];
    }

    return sum;
}

console.log(part_2_sum(1, 2, 3, 4) === 10);
console.log(part_2_sum(1, 2, 3, 4, 5) === 15);


Function.prototype.part_1_myBind = function (ctx){
    const content = this;
    const bindargs = Array.from(arguments).slice(1);

    return function _boundFn() {
        const callArgs = Array.from(arguments);
        return content.apply(ctx, bindargs.concat(callArgs))
    }
}

Function.prototype.part_2_myBind = function(ctx, ...args){
    const content = this;
    return function (...name) {
        return content.apply(ctx, args.concat(name))
    }
}

// class Cat {
//     constructor(name) {
//       this.name = name;
//     }

//     says(sound, person) {
//       console.log(`${this.name} says ${sound} to ${person}!`);
//       return true;
//     }
//   }

  // class Dog {
  //   constructor(name) {
  //     this.name = name;
  //   }
  // }

  // const markov = new Cat("Markov");
  // const pavlov = new Dog("Pavlov");

  // markov.says("meow", "Ned");
  // // Markov says meow to Ned!
  // // true

  // // bind time args are "meow" and "Kush", no call time args
  // markov.says.part_2_myBind(pavlov, "meow", "Kush")();
  // // Pavlov says meow to Kush!
  // // true

  // // no bind time args (other than context), call time args are "meow" and "a tree"
  // markov.says.part_2_myBind(pavlov)("meow", "a tree");
  // // Pavlov says meow to a tree!
  // // true

  // // bind time arg is "meow", call time arg is "Markov"
  // markov.says.part_2_myBind(pavlov, "meow")("Markov");
  // // Pavlov says meow to Markov!
  // // true

  // // no bind time args (other than context), call time args are "meow" and "me"
  // const notMarkovSays = markov.says.part_2_myBind(pavlov);
  // notMarkovSays("meow", "me");
  // // Pavlov says meow to me!
  // // true


// curriedSum

function curriedSum(numOfArgs) {
  const arr = [];
  return function fn(n) {
    arr.push(n);
    if (arr.length < numOfArgs) {
      return fn
    } else {
      console.log(arr.reduce((acc, el) => acc + el));
      return fn;
    }

  }

}

// const sum = curriedSum(4);
// sum(5)(30)(20)(1); // => 56



Function.prototype.curry = function (numArgs) {
  debugger
  const arr = [];

  const that = this;
  function _fn (num) {
    arr.push(num);
    if (arr.length < numArgs) {
      return _fn;
    } else {
      return that.apply(null, arr);
    }
  }

  return _fn;
}

// fn.apply(null, n)

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6)); // == 30

