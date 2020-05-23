import { createStudent } from "../code/student";

describe('Exercises JS225 Object Oriented Javascript Function Contexts, Scopes, and Closures', function () {
  describe('Exercise Ten', function () {
    let actual, expected;
    beforeEach(() => {
      actual = [];
      expected = [];
    });
    describe('Student behavior', function () {
      let myStudent, school;
      beforeEach(() => {
        actual = [];
        expected = [];
        myStudent = createStudent('Foo', '1st');
        school = {
          courses: [
            { name: 'Math', code: 101 },
            { name: 'Advanced Math', code: 102 },
            { name: 'English', code: 201 },
            { name: 'Advanced English', code: 202 },
            { name: 'Physics', code: 301 },
            { name: 'Advanced Physics', code: 302 },
          ]
        }
      });
      afterEach(() => {
        myStudent.clearCourses();
      });

      it('should return the student information', function () {
        expect(myStudent.info()).toBe('Foo is a 1st year student.');
      });

      it('should add a valid course', function () {
        actual.push(myStudent.addCourse({ name: 'Math', code: 101}, school));
        actual.push(myStudent.listCourses());
        expected = ['Course Math: 101 added.', '[{"name":"Math","code":101}]'];
        expect(actual).toEqual(expected);
      });

      it('should not add an invalid course', function () {
        actual.push(myStudent.addCourse({ name: 'Foo', code: 500 }, school));
        actual.push(myStudent.listCourses());
        expected = ['Invalid course, not added.', '[]'];
        expect(actual).toEqual(expected);
      });

      it('should not add a course the student is already enrolled in', function () {
        myStudent.addCourse({ name: 'Math', code: 101 }, school);
        myStudent.addCourse({ name: 'English', code: 201 }, school);
        actual.push(myStudent.addCourse({ name: 'Math', code: 101 }, school), myStudent.listCourses());
        expected = [
          'Already enrolled, course not added.',
          '[{"name":"Math","code":101},{"name":"English","code":201}]'
        ];
        expect(actual).toEqual(expected);
      });

      it('should add a note to a course', function () {
        myStudent.addCourse({ name: 'Math', code: 101 }, school);
        actual.push(myStudent.addNote(101, 'Remember to study for algebra.'))
        actual.push(myStudent.viewNotes());
        expected = [
          'added note: Remember to study for algebra.',
          'Math:\nRemember to study for algebra.',
        ];
        expect(actual).toEqual(expected);
      });

      it('should not allow a note to be added to a non-existant course', function () {
        myStudent.addCourse({ name: 'Physics', code: 301 }, school);
        expect(myStudent.addNote(102, 'Difficult subject.')).toBe('course not found, no note added.');
      });

      it('should not allow exact duplicate notes to be added', function () {
        myStudent.addCourse({ name: 'Advanced Math', code: 102 }, school);
        myStudent.addNote(102, 'Difficult subject.');
        myStudent.addNote(102, 'We use AOPS materials.');
        expect(myStudent.addNote(102, 'Difficult subject.')).toBe('Duplicate note, not added.');
        expected = 'Advanced Math:\nDifficult subject.\nWe use AOPS materials.';
        expect(myStudent.viewNotes()).toBe(expected);
      });

      it('should outputs a formatted string when viewing notes', function () {
        myStudent.addCourse({ name: 'Math', code: 101 }, school);
        myStudent.addCourse({ name: 'English', code: 201 }, school);
        myStudent.addCourse({ name: 'Advanced Math', code: 102 }, school);
        myStudent.addNote(101, 'Remember to study for algebra.');
        myStudent.addNote(201, 'Great novel.');
        myStudent.addNote(102, 'Difficult subject.');
        myStudent.addNote(102, 'We use AOPS materials.');
        expected = 'Math:\nRemember to study for algebra.\nEnglish:\nGreat novel.\n' +
          'Advanced Math:\nDifficult subject.\nWe use AOPS materials.';
        expect(myStudent.viewNotes()).toBe(expected);
      });

      it('updateNote replaces the note for the course', function () {
        myStudent.addCourse({ name: 'Advanced Math', code: 102 }, school);
        myStudent.addNote(102, 'Fun course.');
        myStudent.addNote(102, 'Difficult course.');
        expect(myStudent.viewNotes()).toBe('Advanced Math:\nFun course.\nDifficult course.');
        actual = myStudent.updateNote(102, 'We use AOPS materials.');
        expected = 'Updated Advanced Math: 102 note with "We use AOPS materials."'
        expect(actual).toBe(expected);
        expect(myStudent.viewNotes()).toBe('Advanced Math:\nWe use AOPS materials.');
      });

      it('should add the note with updateNote if no note exists', function () {
        myStudent.addCourse({ name: 'Advanced Math', code: 102 }, school);
        myStudent.updateNote(102, 'Makes me think hard.');
        expect(myStudent.viewNotes()).toBe('Advanced Math:\nMakes me think hard.');
      });

      it('should not update the notes if an incorrect course code is used', function () {
        myStudent.addCourse({ name: 'English', code: 201 }, school);
        myStudent.addNote(201, 'I like reading Dickens.');
        expected = 'course not found, no update.'
        expect(myStudent.updateNote(102, 'I love English Literature')).toBe(expected);
        expect(myStudent.viewNotes()).toBe('English:\nI like reading Dickens.');
      });
    });
  });
});