import { createStudent } from "./student";

let createSchool = (function() {
  let students = [];
  let validYears = [
    '1st', '2nd', '3rd',
    '4th', '5th'
  ];
  function getCourse(student, course) {
    return student.courses.find((aCourse) => aCourse.code === course.code );
  }
  function invalidYear(student) {
    return !validYears.includes(student.getYear());
  }
  return function() {
    return {
      addGrade: function(student, course, grade) {
        let courseToAddGrade = getCourse(student, course);
        if (courseToAddGrade) {
          courseToAddGrade.grade = grade;
          return `Added grade of ${grade} for ${student.getName()} in ${course.name}.`;
        } else {
          return 'Course not found, no grade added.';
        }
      },
      addStudent: function(student) {
        return invalidYear(student) ? 'Invalid year' : students.push(student);
      },
      clearStudents: function() {
        students = [];
        return students;
      },
      enrollStudent: function(student, course, validCourses) {
        return student.addCourse(course, validCourses)
      },
      getReportCard: function(student) {
        return student.courses.reduce((reportCard, course) => {
          if (course.grade) {
            reportCard += `${course.name}: ${course.grade}\n`;
          } else {
            reportCard += `${course.name}: In progress\n`;
          }
          return reportCard;
        }, '');
      }
    }
  }
})()

export { createStudent, createSchool };