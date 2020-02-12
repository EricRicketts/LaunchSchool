function examAverage(examScores) {
  let numberOfExams = examScores.length;
  return examScores.reduce((sum, score) => sum + score, 0) / numberOfExams;
}

function finalGrade(scores) {
  const grades = {
    'A': range(93, 100),
    'B': range(85, 92),
    'C': range(77, 84),
    'D': range(69, 76),
    'E': range(60, 68),
    'F': range(0, 59),
  };
  const EXAM_WEIGHT = 0.65;
  const EXERCISE_WEIGHT = 0.35;
  let examAvg = examAverage(scores.exams);
  let exerciseTotal = scores.exercises.reduce((total, score) => total + score, 0);

  let numericGrade = Math.round(EXAM_WEIGHT*examAvg + EXERCISE_WEIGHT*exerciseTotal);

  let letterGrade = Object.entries(grades).find(function(gradeAndRange) {
    let gradeRange = gradeAndRange[1];
    return gradeRange.includes(numericGrade);
  })[0];

  return numericGrade + ' (' + letterGrade + ')';
}
function generateClassRecordSummary(studentRecords) {
  let studentSummary = { studentGrades: [], exams: [], };
  let studentScores = Object.values(studentRecords).map((studentRecord) => studentRecord.scores );

  let classSummary = studentScores.reduce(function(finalSummary, scores) {
    studentSummary.studentGrades.push(finalGrade(scores));
    return studentSummary;
  }, studentSummary);

  let classExams = [0, 1, 2, 3].reduce(function(examNumberResults, examNumber) {
    let individualStudentExam = studentScores.reduce(function(studentExamNumberResults, studentScore) {
      studentExamNumberResults.push(studentScore.exams[examNumber]);
      return studentExamNumberResults;
    }, []);
    examNumberResults.push(individualStudentExam);
    return examNumberResults;
  }, []);

  classExams.forEach(function(examNumberScores) {
    let examData = {
      average: Number.parseFloat(examAverage(examNumberScores).toFixed(1)),
      minimum: Math.min(...examNumberScores),
      maximum: Math.max(...examNumberScores),
    };
    classSummary.exams.push(examData);
  });

  return classSummary;
}

function range(start, end) {
  return Array.from( { length: end - start + 1 }, function(key, value) {
    return start + value;
  } );
}

export { generateClassRecordSummary };