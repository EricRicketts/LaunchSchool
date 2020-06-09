function Person(firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
}
Person.prototype.communicate = function() {
  return 'Communicating';
}
Person.prototype.eat = function() {
  return 'Eating';
}
Person.prototype.fullName = function() {
  return `${this.firstName} ${this.lastName}`;
}
Person.prototype.sleep = function() {
  return 'Sleeping';
}
function Doctor(firstName, lastName, age, gender, specialization) {
  Person.call(this, firstName, lastName, age, gender);
  this.specialization = specialization;
}

Doctor.prototype = Object.create(Person.prototype, {
  constructor: {
    enumerable: false,
    writable: true,
    configurable: true,
    value: Doctor
  }
});
Doctor.prototype.diagnose = function() {
  return 'Diagnosing';
}

function Professor(firstName, lastName, age, gender, subject) {
  Person.call(this, firstName, lastName, age, gender);
  this.subject = subject;
}
Professor.prototype = Object.create(Person.prototype);
Professor.prototype.constructor = Professor;
Professor.prototype.teach = function() {
  return 'Teaching';
}

function Student(firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);
  this.degree = degree;
}
Student.prototype = Object.create(Person.prototype, {
  constructor: {
    enumerable: false,
    writable: true,
    configurable: true,
    value: Student
  }
});
Student.prototype.study = function() {
  return 'Studying';
}

function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  Student.call(this, firstName, lastName, age, gender, degree);
  this.graduateDegree = graduateDegree;
}
GraduateStudent.prototype = Object.create(Student.prototype, {
  constructor: {
    enumerable: false,
    writable: true,
    configurable: true,
    value: GraduateStudent
  }
});
GraduateStudent.prototype.research = function() {
  return 'Researching';
}
export { Doctor, GraduateStudent, Person, Professor, Student };