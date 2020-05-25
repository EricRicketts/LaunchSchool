import { createStudent } from "./student";

let createSchool = (function() {
  let students = [];
  let validYears = [
    '1st', '2nd', '3rd',
    '4th', '5th'
  ];
  function invalidYear(student) {
    return !validYears.includes(student.getYear());
  }
  return function() {
    return {
      addStudent: function(student) {
        return invalidYear(student) ? 'Invalid year' : students.push(student);
      },
      clearStudents: function() {
        students = [];
        return students;
      },
      enrollStudent: function(student, course, validCourses) {
        return student.addCourse(course, validCourses)
      }
    }
  }
})()

export { createStudent, createSchool };