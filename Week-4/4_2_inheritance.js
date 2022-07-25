var Person = function(){};

Person.prototype.initialize = function(name , age) {
    this.name = name;
    this.age = age;
}

function Teacher(name , age) {
    Person.call(this, name, age);

    Teacher.prototype.teach = function(subject) {
        this.subject = subject;
        console.log(Teacher.name +" is now teaching " + this.subject);
    }
}

Teacher.prototype = Object.create(Person.prototype);
Teacher.prototype.constructor = Person;

var person = new Person();
var him = new Teacher();

him.initialize("Adam" , 45);
him.teach("inheritance");