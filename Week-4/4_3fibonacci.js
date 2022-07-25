const fib = (n) => ({
    [Symbol.iterator]: () => {
        let i = 1;
        let first = 0, second = 0;
        return {
            next:() => {
                if(i++ <= n){
                    [first, second] = [second, (first + second) || 1];
                    return { value: first, done: false }
                }
                else {
                    return { done: true }
                }
            }
        }
    }
});

for(let val of fib(8)) {
    console.log(val);
}