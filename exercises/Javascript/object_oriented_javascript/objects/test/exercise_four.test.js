import { createStudent } from "../code/student";

describe('Exercises JS225 Object Oriented Javascript Objects Exercise Four', function () {
  let foo, expected;
  beforeEach(() => {
    foo = createStudent('Foo', '1st');
  });

  it('should return information on the student', function () {
    expect(foo.info()).toBe('Foo is a 1st year student');
  });

  it('course initialized to an empty array', function () {
    expect(foo.listCourses()).toEqual([]);
  });

  it('should be able to add courses', function () {
    let firstCourse = { name: 'Math', code: 101 };
    let secondCourse = { name: 'Advanced Math', code: 102 };
    foo.addCourse(firstCourse);
    foo.addCourse(secondCourse);
    expected = '[{"name":"Math","code":101},{"name":"Advanced Math","code":102}]';
    expect(foo.listCourses()).toBe(expected);
  });

  it('should add notes to a course', function () {
    let firstCourse = { name: 'Math', code: 101 };
    let secondCourse = { name: 'Advanced Math', code: 102 };
    foo.addCourse(firstCourse);
    foo.addCourse(secondCourse);
    foo.addNote(101, 'Fun course');
    foo.addNote(101, 'Remember to study for algebra');
    expected = 'Math: Fun course; Remember to study for algebra';
    expect(foo.viewNotes()).toBe(expected);
  });

  it('should add notes to different courses', function () {
    let firstCourse = { name: 'Math', code: 101 };
    let secondCourse = { name: 'Advanced Math', code: 102 };
    foo.addCourse(firstCourse);
    foo.addCourse(secondCourse);
    foo.addNote(101, 'Fun course');
    foo.addNote(101, 'Remember to study for algebra');
    foo.addNote(102, 'Difficult subject');
    expected = 'Math: Fun course; Remember to study for algebra\nAdvanced Math: Difficult subject';
    expect(foo.viewNotes()).toBe(expected);
    foo.updateNotes(101, 'Fun course');
    expected = 'Math: Fun course\nAdvanced Math: Difficult subject';
    expect(foo.viewNotes()).toBe(expected);
  });
});