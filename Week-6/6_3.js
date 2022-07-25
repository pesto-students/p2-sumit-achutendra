const sortArr = (arr , n) => {
    
    let count0 = 0, count1 = 0, count2 = 0, i;
    
    
    for(i = 0; i < n; i++) {
        switch(arr[i]) {
            case 0:
                count0++;
                break;
            case 1:
                count1++;
                break;
            case 2:
                count2++;
                break;
        }
    }
      

    i = 0;
    while(count0 > 0) {
        arr[i++] = 0;
        count0--;
    }
  
    while(count1 > 0) {
        arr[i++] = 1;
        count1--;
    }
  
    while(count2 > 0) {
        arr[i++] = 2;
        count2--;
    }
  
    return arr;
}


let arr = [1,0,2,2,0,1];
let n = arr.length;
console.log(arr);
console.log(n);
console.log(sortArr(arr , n));