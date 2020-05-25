import { createStudent, createSchool} from "../code/school";

describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercise Ten', function () {
    describe('School behavior', function () {
      let foo, bar, qux, schoolCourses, elmer, school, math, advancedMath, physics, english, actual, expected;
      beforeEach(() => {
        math = { name: 'Math', code: 101 };
        advancedMath = { name: 'Advanced Math', code: 102 };
        physics = { name: 'physics', code: 202 };
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
    });
  });
});