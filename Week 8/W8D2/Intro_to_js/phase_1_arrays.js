// array#uniq

Array.prototype.uniq = function () {
    let uniq = [];
    for (let i = 0; i < this.length; i++) {
        if (!uniq.includes(this[i])) {
            uniq.push(this[i]);
        }
    }
    return uniq;
}

// console.log([1,2,2,3,3,3].uniq())

// array#twoSum

Array.prototype.twoSum = function () {
    let indices = [];
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i+1; j < this.length; j++) {
            if (this[i] + this[j] === 0){
                indices.push([i,j]);
            }
        }
    }
    return indices
}

// console.log([-2,-1,0,1,2,3,4,5].twoSum())

// array#transpose

Array.prototype.transpose = function () {
    let transposed = [];
    for(var i = 0; i < this.length; i++){
        transposed.push([]);
    };

    for(let i = 0; i < this.length; i++) {
        for(let j = 0; j < this.length; j++) {
            transposed[i].push(this[j][i])
        }
    }
    return transposed
}

let arr = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
];

// console.log(arr.transpose())
