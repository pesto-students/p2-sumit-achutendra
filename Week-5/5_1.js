async function func() {
  let promise1 = new Promise((resolve , reject) => {
      setTimeout(function () { resolve("promise1 resolved")}, 1000);
  });
  let promise2 = new Promise((resolve , reject) => {
      setTimeout(function () { resolve("promise2 resolved")}, 1000);
  });
  let promise3 = new Promise((resolve , reject) => {
      setTimeout(function () { resolve("promise3 resolved")}, 1000);
  });

  let res1 = await promise1;
  let res2 = await promise2;
  let res3 = await promise3;
  console.log(res1);
  console.log(res2);
  console.log(res3);
  // return res;
}

func();

function* genfunc() {
  console.log('First execution.');
    yield 'Yield First execution, saved the state and exit';
    console.log('Second execution will be on next() call.');  
    yield 'Yield second execution, saved the state and exit';
    console.log('Third execution will be on next() call.');  
    yield 'Yield Third execution, saved the state and exit';
}

const generatorObj = genfunc();

setTimeout(() => console.log(generatorObj.next()), 1000);
setTimeout(() => console.log(generatorObj.next()), 1000);
setTimeout(() => console.log(generatorObj.next()), 1000);