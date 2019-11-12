describe('Student Grade', function () {
  function studentGrade(grades) {
    var num_grades = grades.length;
    var avg = grades.reduce(function(sum, grade) { return sum += grade; }, 0)/num_grades;
    var output = 'Based on the average of your ' + num_grades + ' scores your letter grade is ';
    var grade = '';

    if (avg >= 90) {
      grade = '\"A\".';
    } else if (avg >= 70 && avg < 90) {
      grade = '\"B\".';
    } else if (avg >= 50 && avg < 70) {
      grade = '\"C\".';
    } else {
      grade = '\"F\".';
    }

    return output + grade
  }

  it('calculates student grades for a B', function (done) {
    var grades = [90, 50, 78];
    expect(studentGrade(grades)).to.equal('Based on the average of your 3 scores your letter grade is "B".');
    done();
  });

  it('calculates student grades for an A', function (done) {
    var grades = [90, 85, 95, 92];
    expect(studentGrade(grades)).to.equal('Based on the average of your 4 scores your letter grade is "A".');
    done();
  });

  it('calculates student grades for an C', function (done) {
    var grades = [90, 50, 60, 70, 65];
    expect(studentGrade(grades)).to.equal('Based on the average of your 5 scores your letter grade is "C".');
    done();
  });

  it('calculates student grades for an F', function (done) {
    var grades = [40, 50];
    expect(studentGrade(grades)).to.equal('Based on the average of your 2 scores your letter grade is "F".');
    done();
  });
});