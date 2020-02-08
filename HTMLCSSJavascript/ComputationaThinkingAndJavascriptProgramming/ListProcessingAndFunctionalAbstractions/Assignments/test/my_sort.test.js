describe('LS215 Sorting Lesson Using Builtin Sort Function', function () {
  let studentGrades, compareGradesOne, compareGradesTwo, expected;
  beforeEach(() => {
    studentGrades = [
      { name: 'StudentA', grade: 90.1 },
      { name: 'StudentB', grade: 92 },
      { name: 'StudentC', grade: 91.8 },
      { name: 'StudentD', grade: 95.23 },
      { name: 'StudentE', grade: 91.81 },
    ];
    expected = [
      { name: 'StudentA', grade: 90.1 },
      { name: 'StudentC', grade: 91.8 },
      { name: 'StudentE', grade: 91.81 },
      { name: 'StudentB', grade: 92 },
      { name: 'StudentD', grade: 95.23 },
    ];
    compareGradesOne = function(studentOne, studentTwo) {
      if (studentOne.grade < studentTwo.grade) {
        return -1;
      } else if (studentOne.grade > studentTwo.grade) {
        return 1;
      } else {
        return 0;
      }
    };
    compareGradesTwo = function(studentOne, studentTwo) {
      return studentOne.grade - studentTwo.grade;
    };
  });

  it('sort grades in ascending order compareGradesOne', function () {
    expect(studentGrades.sort(compareGradesOne)).toEqual(expected);
  });

  it('sort grades in ascending order compareGradesTwo', function () {
    expect(studentGrades.sort(compareGradesTwo)).toEqual(expected);
  });
});