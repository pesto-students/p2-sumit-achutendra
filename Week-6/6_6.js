function threeSumClosest (s, target) {
    
    s.sort((a, b) => a - b);
    
    const n = s.length;
    
    let closest = s[0] + s[1] + s[n - 1];
    
    for (let i = 0; i < n - 2; i++) {
        
        let j = i + 1;
        let k = n - 1;
        
        while (j < k) {
            let sum = s[i] + s[j] + s[k];
            if (sum <= target) {
                j++;
            } else {
                k--;
            }
            if (Math.abs(closest - target) > Math.abs(sum - target)) {
                closest = sum;
            }
        }
    }
    return closest;
}

let target = 1;
let  s = [-1, 2, 1, -4];

console.log(threeSumClosest(s , 1));