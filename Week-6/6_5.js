const findPair = (arr, b) => {
    for(let i = 0; i < arr.length-1; i++) {
        let findNum = arr[i] + b;
        for(let j = i+1; j<arr.length; j++) {
            if(arr[j] === findNum) return 1;
        }
    }

    return 0;
}

let arr = [5,10,3,2,50,80];
let b = 78;
let arr1 = [-10,20];
let b1 = 30;


console.log(findPair(arr , b));
console.log(findPair(arr1 , b1));