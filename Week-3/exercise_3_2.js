function multiply(a , b){
    return this.a * this.b;
}

// .bind example
const resB = multiply.bind({ a:10, b:2 });
// result will not change .bind binds the value parmanently
const resC = resB.bind({ a:102, b:25 }); 
console.log(".bind example result : ");
console.log(resB());
console.log(resC());


//.call example
//function that adds two numbers 
function sum(a, b) {
    return a + b;
  }
  
  // calling sum() function  
  var result = sum.call(this, 5, 10);
  
  console.log(".call result : ")
  console.log(result);


  // .apply example

  // object definition
const personName = {
    firstName: "Achutendra",
    lastName: "Singh",
  };
  
  // function definition
  function greet(wish, message) {
    return `${this.firstName}, ${wish}. ${message}`;
  }
  
  // calling greet() function by passing two arguments
  let res = greet.apply(personName, ["Good morning", "How are you?"]);
  
  console.log(".apply result : ")
  console.log(res);