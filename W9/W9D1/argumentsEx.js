// function sum() {
//   let total = 0;
//   let arr = [...arguments];

//   arr.forEach((ele) => {
//     total += ele;
//   });

//   console.log(total);
//   return total;
// }

// Rewrite your myBind method so that it can take both
// bind-time arguments and call-time arguments.

// Function.prototype.myBind = function(argument) {
//     let that = this;
//     let args = Array.from(arguments).slice(1);
//     let context = argument;

//     return function() {
//         let args2 = Array.prototype.slice.call(arguments)
//         let total = args.concat(args2)
//         that.apply(context, total)
//     }
// }

Function.prototype.myBind = function (arg, ...args) {
  let that = this;

  return function (...call) {
    that.apply(arg, args.concat(call));
  };
};

function curriedSum(arg) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    console.log(numbers);
    if (numbers.length === arg) {
      return numbers.reduce((acc, ele) => {
        return acc + ele;
      });
    } else {
      return _curriedSum;
    }
  };
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs) {
  let numbers = [];
  let that = this;
  return function curryFunc(arg) {
    numbers.push(arg);
    // numArgs = numArgs || func.length;
    if (numbers.length === numArgs) {
      return that.apply(that, numbers);
      // return that.apply(that, numbers) ;
    } else {
      return curryFunc;
    }
  }
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

// or more briefly:
console.log(sumThree.curry(3)(4)(20)(6));
