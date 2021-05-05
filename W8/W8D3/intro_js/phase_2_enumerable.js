Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  return this;
};
let callback = function (ele) {
  console.log(ele)
  return ele + ele;
};
// console.log([1, 2, 3].myEach(callback));

// Array#myMap(callback) - receives a callback function, returns a new array of the results of calling the callback function on each element of the array
// should use myEach and a closure


Array.prototype.myMap = function (callback) {
  const arr = []; 
  
  this.myEach (function(ele) {

    arr.push(callback(ele));
  })

  return arr;
};

// console.log([1, 2, 3].myMap(callback));

// accumulator will be another function 

Array.prototype.myReduce = function(func, value) {
  let arr = this;
  if (value === undefined) {
    value = arr[0] 
    arr = arr.slice(1)
    
  }
  let result = value

  arr.myEach (function(ele) {

    result = callback(result, ele)
  })

  return result;
}
console.log([1,2,3,4,5].myReduce(function (total, item) {
  total + item
}) )

