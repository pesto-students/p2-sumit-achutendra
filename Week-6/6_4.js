function maximumProfitStock(price , n){
    let buy = price[0];
    let maxprofit = 0;
    for (let i = 1; i < n; i++){
        if(buy > price[i]){
            buy = price[i];
        }
        else if(price[i] - buy > maxprofit) {
            maxprofit = price[i] - buy;
        }
    }
    return maxprofit;
}

let price = [7,1,5,3,6,4];
let n = price.length;

console.log(maximumProfitStock(price , n));
