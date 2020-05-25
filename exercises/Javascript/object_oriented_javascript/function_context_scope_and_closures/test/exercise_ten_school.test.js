import { createStudent, createSchool} from "../code/school";

describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercise Ten', function () {
    describe('School behavior', function () {
      let foo, bar, qux, schoolCourses, elmer, school, math, advancedMath, physics, english, actual, expected;
      beforeEach(() => {
        math = { name: 'Math', code: 101 };
        advancedMath = { name: 'Advanced Math', code: 102 };
        physics = { name: 'Physics', code: 202 };
        english = { name: 'English', code: 301 };
        schoolCourses = {
          courses: [math, advancedMath, physics, english]
        }
        foo = createStudent('foo', '3rd');
        foo.addCourse({ name: 'Math', code: 101, grade: 95 }, schoolCourses);
        foo.addCourse({ name: 'Advanced Math', code: 102, grade: 90 }, schoolCourses);
        foo.addCourse({ name: 'Physics', code: 202 }, schoolCourses);

        bar = createStudent('bar', '1st');
        bar.addCourse({ name: 'Math', code: 101, grade: 91 }, schoolCourses);

        qux = createStudent('qux', '2nd');
        qux.addCourse({ name: 'Math', code: 101, grade: 93 }, schoolCourses);
        qux.addCourse({ name: 'Advanced Math', code: 102, grade: 90 }, schoolCourses);

        elmer = createStudent('elmer', '4th');

        school = createSchool();
        school.addStudent(foo);
        school.addStudent(bar);
        school.addStudent(qux);
      });

      afterEach(() => {
        school.clearStudents();
      })

      it('does not allow a student to be added with an incorrect grade level', function () {
        elmer = createStudent('Elmer', '6th');
        expect(school.addStudent(elmer)).toBe('Invalid year');
      });

      it('should add a student and return how many students are enrolled', function () {
        expect(school.addStudent(elmer)).toBe(4);
      });

      it('should enroll a student in a course', function () {
        school.addStudent(elmer);
        expect(school.enrollStudent(elmer, math, schoolCourses)).toBe('Course Math: 101 added.');
        expect(elmer.courses).toEqual([math]);
      });

      it('should add a grade for a student enrolled in a course', function () {
        expected = { name: 'Math', code: 101, grade: 85 };
        school.addStudent(elmer);
        school.enrollStudent(elmer, math, schoolCourses);
        expect(school.addGrade(elmer, math, 85)).toBe('Added grade of 85 for elmer in Math.');
        expect(elmer.courses).toEqual([expected]);
      });

      it('should not add a grade for a student not enrolled in the course', function () {
        school.addStudent(elmer);
        school.enrollStudent(elmer, math, schoolCourses);
        expect(school.addGrade(elmer, english, 90)).toBe('Course not found, no grade added.');
      });

      it('should return a student\'s report card', function () {
        expected = 'Math: 95\nAdvanced Math: 90\nPhysics: In progress\n';
        actual = school.getReportCard(foo);
        expect(actual).toBe(expected);
      });

      it('should return a course report', function () {
        expected = [
          '=Math Grades=\nfoo: 95\nbar: 91\nqux: 93\n---\nCourse Average: 93\n',
          '=Advanced Math Grades=\nfoo: 90\nqux: 90\n---\nCourse Average: 90\n',
          undefined
        ];
        actual = [
          school.courseReport('Math'),
          school.courseReport('Advanced Math'),
          school.courseReport('Physics')
        ];
        expect(actual).toEqual(expected);
      });
    });
  });
});