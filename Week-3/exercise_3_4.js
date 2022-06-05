function createStack(){
    let items = [];
    return{
        // add element to the stack
        push: function(element) {
            return items.push(element);
        },
    
        // remove element from the stack
        pop: function() {
            if(items.length > 0) {
                return items.pop();
            }
        },
        show: function(){
            return items;
        }
    };
}

let stack = new createStack();
stack.push(10);
stack.push(5);
// stack.pop();
console.log(stack.items);
console.log(stack.show())