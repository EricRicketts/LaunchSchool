function calculateNumericGrade(scores) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISE_WEIGHT = 0.35;
  let examAvg = examAverage(scores.exams);
  let exerciseTotal = scores.exercises.reduce((total, score) => total + score, 0);

  return Math.round(EXAM_WEIGHT*examAvg + EXERCISE_WEIGHT*exerciseTotal);
}

function examAverage(examScores) {
  let numberOfExams = examScores.length;
  return examScores.reduce((sum, score) => sum + score, 0) / numberOfExams;
}

function finalGrade(scores) {
  let numericGrade = calculateNumericGrade(scores);
  let letterGrade = findLetterGrade(numericGrade);

  return numericGrade + ' (' + letterGrade + ')';
}

function findLetterGrade(numericGrade) {
  const GRADES = {
    'A': range(93, 100),
    'B': range(85, 92),
    'C': range(77, 84),
    'D': range(69, 76),
    'E': range(60, 68),
    'F': range(0, 59),
  };

  return Object.entries(GRADES).find(function(gradeAndRange) {
    let gradeRange = gradeAndRange[1];
    return gradeRange.includes(numericGrade);
  })[0];
}

function generateClassRecordSummary(studentRecords) {
  let classSummary = { studentGrades: [], exams: [], };
  let studentScores = Object.values(studentRecords).map((studentRecord) => studentRecord.scores );

  classSummary.studentGrades = studentScores.reduce(function(studentGrade, scores) {
    studentGrade.push(finalGrade(scores));
    return studentGrade;
  }, []);

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