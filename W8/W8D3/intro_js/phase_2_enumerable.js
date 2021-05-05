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
console.log([1, 2, 3].myEach(callback));
