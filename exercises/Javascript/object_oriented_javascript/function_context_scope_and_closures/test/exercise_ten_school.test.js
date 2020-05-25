import { createStudent, createSchool} from "../code/school";

describe('Exercises JS225 Object Oriented Javascript Function Context, Scopes, and Closures', function () {
  describe('Exercise Ten', function () {
    describe('School behavior', function () {
      let foo, bar, qux, schoolCourses, elmer, school, actual, expected;
      beforeEach(() => {
        schoolCourses = {
          courses: [
            { name: 'Math', code: 101 },
            { name: 'Advanced Math', code: 102 },
            { name: 'Physics', code: 202 },
            { name: 'English', code: 301 }
          ]
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
    });
  });
});