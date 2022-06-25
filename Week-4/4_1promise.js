const  p = new Promise(function (resolve , reject) {
    function getNumber () {
        let num = Math.floor(Math.random() * (100 - 1)) + 1;
        return num;
    }
    const ranNum = getNumber();
    console.log(ranNum);

    if (ranNum % 5 == 0) {
        reject(ranNum);
    }
    else {
        resolve(ranNum);
    }
});

p.then((val) => console.log(`resolved value - ${val}`))
 .catch((val) => console.error(`rejected value - ${val}`))
 .finally(() => console.log("promise completion"))

 