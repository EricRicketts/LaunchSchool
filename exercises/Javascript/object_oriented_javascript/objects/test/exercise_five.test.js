import { createSchool } from "../code/school";

describe('Exercises JS225 Object Oriented Javascript Objects Exercise Five', function () {
  let school, actual, expected, math, advancedMath, physics;
  beforeEach(() => {
    school = createSchool();
    school.addStudent('Foo', '3rd');
    school.addStudent('Bar', '1st');
    school.addStudent('Qux', '2nd');
    math = { name: 'Math', code: 101 };
    advancedMath = { name: 'Advanced Math', code: 102 };
    physics = { name: 'Physics', code: 202 };
    school.enrollStudent('Foo', '3rd', math);
    school.enrollStudent('Foo', '3rd', advancedMath);
    school.enrollStudent('Foo', '3rd', physics);
    school.enrollStudent('Bar', '1st', math);
    school.enrollStudent('Qux', '2nd', math);
    school.enrollStudent('Qux', '2nd', advancedMath);
  });

  describe('add, get, add grade and count students already enrolled', function () {
    it('should get a student from the school', function () {
      expected = {
        name: 'Qux',
        year: '2nd',
        courses: [
          { name: 'Math', code: 101 },
          { name: 'Advanced Math', code: 102 },
        ],
      }
      let student = school.getStudent('Qux', '2nd');
      actual = {
        name: student.name,
        year: student.year,
        courses: student.courses
      }
      expect(actual).toEqual(expected);
    });

    it('should count the number of students in the school', function () {
      expect(school.numberOfStudents()).toBe(3);
    });

    it('adding a student with an incorrect year returns an error message', function () {
      expect(school.addStudent('Elmer', '6th')).toBe('Invalid year');
    });

    it('should add a grade to a student course', function () {
      school.addGrade('Foo', '3rd', math, 95);
      let student = school.getStudent('Foo', '3rd');
      actual = {
        name: student.name,
        year: student.year,
        courses: student.courses
      }
      expected = {
        name: 'Foo',
        year: '3rd',
        courses: [
          { name: 'Math', code: 101, grade: 95, },
          { name: 'Advanced Math', code: 102 },
          { name: 'Physics', code: 202, }
        ]
      }
      expect(actual).toEqual(expected);
    });
  });

  describe('Report Cards and Course Reports', function () {
    beforeEach(() => {
      school.addGrade('Foo', '3rd', math, 95);
      school.addGrade('Foo', '3rd', advancedMath, 90);
      school.addGrade('Bar', '1st', math, 91);
      school.addGrade('Qux', '2nd', math, 93);
      school.addGrade('Qux', '2nd', advancedMath, 90);
    });

    it('should get a report card for a student', function () {
      actual = school.getReportCard('Foo', '3rd');
      expected = 'Math: 95\nAdvanced Math: 90\nPhysics: In progress\n';
      expect(actual).toBe(expected);
    });

    it('should produce a course report for the math course', function () {
      expected = '=Math Grades=\nFoo: 95\nBar: 91\nQux: 93\n---\nCourse Average: 93\n';
      actual = school.courseReport('Math');
      expect(actual).toBe(expected);
    });

    it('should produce a course report for the advanced math course', function () {
      expected = '=Advanced Math Grades=\nFoo: 90\nQux: 90\n---\nCourse Average: 90\n';
      actual = school.courseReport('Advanced Math');
      expect(actual).toBe(expected);
    });
  });
});