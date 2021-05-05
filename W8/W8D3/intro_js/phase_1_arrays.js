Array.prototype.uniq = function () {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    if (!arr.includes(this[i])) {
      arr.push(this[i]);
    }
  }
  return arr;
};

console.log([1, 2, 2, 3, 3, 3].uniq());
