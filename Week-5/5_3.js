function hasDuplicate(arr) {
    let val = new Set(arr);
    if (val.size !== arr.length) {
        return true;
    }else {
        return false;
    }
}

console.log(hasDuplicate([1,3,4,5]));
console.log(hasDuplicate([1,1,3,4,5]));