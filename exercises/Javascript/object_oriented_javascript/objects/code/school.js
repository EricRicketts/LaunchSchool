import { createStudent } from "./student";

function createSchool() {
  return {
    students: [],
    addGrade: function(name, year, course, grade) {
      let student = this.getStudent(name, year);
      let foundCourse = student.courses.find((currentCourse) => {
        return currentCourse.name === course.name && currentCourse.code === course.code;
      });
      foundCourse.grade = grade;
    },
    addStudent: function(name, year) {
      const validYears = ['1st', '2nd', '3rd', '4th', '5th'];
      let student;
      if (!validYears.includes(year)) {
        return 'Invalid year';
      } else {
        student = createStudent(name, year);
        this.students.push(student);
      }

      return student;
    },
    courseReport: function(courseName) {
      let studentsEnrolledInCourse = this.students.filter((student) => {
        let courses = student.courses;
        return courses.some((course) => course.name === courseName );
      });
      let studentNamesAndGradesInCourse = studentsEnrolledInCourse.map((student) => {
        let studentName = student.name;
        let course = student.courses.find((course) => course.name === courseName);
        let courseGrade = course.grade;
        return { name: studentName, grade: courseGrade };
      });
      let sumOfGrades = studentNamesAndGradesInCourse.reduce((sum, student) => sum + student.grade, 0);
      let averageCourseGrade = (sumOfGrades / studentNamesAndGradesInCourse.length).toFixed();
      let title = `=${courseName} Grades=`;
      let studentNamesAndGrades = studentNamesAndGradesInCourse.map((student) => `${student.name}: ${student.grade}`).join('\n');
      return [title, studentNamesAndGrades, `---\nCourse Average: ${averageCourseGrade}\n`].join('\n');
    },
    enrollStudent: function(name, year, course) {
      let student = this.students.find((student) => student.name === name && student.year === year);
      student.addCourse(course);
    },
    numberOfStudents: function() {
      return this.students.length;
    },
    getReportCard: function(name, year) {
      let student = this.getStudent(name, year);
      let noGradePhrase = 'In progress';
      let courses = student.courses;
      return courses.map((course) => {
        let grade = course.grade ? course.grade : noGradePhrase;
        return course.name + ': ' + grade;
      }).join('\n') + '\n';
    },
    getStudent: function(name, year) {
      return this.students.find((student) => student.name === name && student.year ===  year);
    }
  }
}

export { createSchool };