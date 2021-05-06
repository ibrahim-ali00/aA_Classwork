Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (!sorted) {
    sorted = true;
    for (let i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }
  return this;
};

// console.log([5, 7, 3, 2, 4, 43, 34, 1411].bubbleSort());

// String#substrings - receives a string, returns an array of all substrings

String.prototype.subStrings = function () {

  const arr = []; 

  for (let i = 0; i < this.length; i++) {
    arr.push(this[i]);
    let string = this[i];
    for (let j = i + 1; j < this.length; j++) {
      string += this[j];
      arr.push(string)
    }
  }



  return arr;
}
// console.log("cats".subStrings());

