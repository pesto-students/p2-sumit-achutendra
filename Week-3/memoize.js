function memoize(fn){
    const cache = new Map();
    return function(...args){
        const key = args.toString();
        console.log('fn called with' + key);
        console.log(cache);
        if (cache.has(key)){
            return cache.get(key);
        }
        cache.set(key, fn(...args));
        return cache.get(key);
    };
}

function time(fn){
    console.time();
    fn();
    console.timeEnd();
}

function add(...args){
    return args.reduce(function(acc,cur){
        return acc + cur;
    },0)
}

const addM = memoize(add);

time(() => addM(3,4,5));
time(() => addM(3,4,8));
time(() => addM(3,4,8,4,5,6,7,7,2,3,4,45,6,6454,4545475,5));
time(() => addM(3,4,8,4,5,6,7,7,2,3,4,45,6,6454,4545475,5));
time(() => addM(3,4,8,4,5,6,7,7,));
time(() => addM(3,4,8,4,5,6,7,7,));
time(() => addM(3,4,8));
time(() => addM(3,4,8));
time(() => addM(3,4,8));