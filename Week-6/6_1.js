function maxSubArraySum(arr , n) {
    let maxSum = 0;
    let currSum = 0;

    for (let i = 0; i < n; i++) {
        currSum = Math.max(currSum + arr[i] , 0);
        maxSum = Math.max(maxSum , currSum);
    }
    return maxSum;
}

let arr = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
let n = arr.length;
console.log(maxSubArraySum(arr , n));