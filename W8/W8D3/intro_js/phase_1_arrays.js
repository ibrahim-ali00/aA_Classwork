// Array.uniq

Array.prototype.uniq = function () {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    if (!arr.includes(this[i])) {
      arr.push(this[i]);
    }
  }
  return arr;
};

// console.log([1, 2, 2, 3, 3, 3].uniq());


// Array.twosum

Array.prototype.twoSum = function () {
    const arr = []; //can use let or const in this case
    for (let i = 0; i < this.length; i++) {
        for (let j = 1; j < this.length; j++) {
            if (j > i && this[i] + this[j] === 0) {
                arr.push([i,j]);  
            }
        }
    }
    return arr;
}

// console.log([1,2,4,-1,3,-4].twoSum()); 

Array.prototype.transpose = function () {

    const arr = [];
    for (let i = 0; i < this.length; i++) {
        let row = [];
        for (let j = 0; j < this.length; j++) {
            row.push(this[j][i])     
        }
        arr.push(row)
    }
    return arr;
}

console.log([[1,2,3], [4,5,6], [7,8,9]].transpose());


