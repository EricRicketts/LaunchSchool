let subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya']
}

function makeMathRollCall() {
  return function(students) {
    return rollCall('Math', students)
  }
}

function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b);
  }
}

function makeSubN(n) {
  return function(a) {
    return subtract(a, n);
  }
}

function multiply(a, b) {
  return a * b;
}

function rollCall(subject, students) {
  return subject + ':' + '\n' + students.join('\n');
}

function subtract(a, b) {
  return a - b;
}

function sub5(a) {
  return subtract(a, 5);
}

export { subtract, sub5, makePartialFunc, makeSubN, multiply, subjects, makeMathRollCall };