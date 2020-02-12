function calculateNumericGrade(exercisesAndExams) {
  const EXAM_WEIGHT = 0.65;
  const EXERCISE_WEIGHT = 0.35;
  let examAvg = examAverage(exercisesAndExams.exams);
  let exerciseTotal = exercisesAndExams.exercises.reduce((total, score) => total + score, 0);

  return Math.round(EXAM_WEIGHT*examAvg + EXERCISE_WEIGHT*exerciseTotal);
}

function compileExamData(studentScores) {
  // for each of the student exam results collect the exams by exam number
  // there were four exams, so the exam data will be an array of four arrays
  // with each subarray containing the number of elements equal to the number of students

  const EXAM_NUMBERS = [0, 1, 2, 3];
  let classExamData = EXAM_NUMBERS.reduce(function(examNumberResults, examNumber) {
    let individualStudentExams = studentScores.reduce(function(studentExamNumberResults, studentScore) {
      studentExamNumberResults.push(studentScore.exams[examNumber]);
      return studentExamNumberResults;
    }, []);
    examNumberResults.push(individualStudentExams);
    return examNumberResults;
  }, []);

  return classExamData.reduce(function(examStatisticalResults, examData) {
    let examStatistics = {
      average: Number.parseFloat(examAverage(examData).toFixed(1)),
      minimum: Math.min(...examData),
      maximum: Math.max(...examData),
    };
    examStatisticalResults.push(examStatistics);
    return examStatisticalResults;
  }, []);
}

function compileStudentGrades(studentScores) {
  return studentScores.reduce(function(studentGrades, exercisesAndExams) {
    studentGrades.push(finalGrade(exercisesAndExams));
    return studentGrades;
  }, []);
}

function examAverage(examScores) {
  let numberOfExams = examScores.length;
  return examScores.reduce((sum, score) => sum + score, 0) / numberOfExams;
}

function finalGrade(exercisesAndExams) {
  let numericGrade = calculateNumericGrade(exercisesAndExams);
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
    let gradeRange = gradeAndRange[1]; // get numbers in grade range, which is an array
    return gradeRange.includes(numericGrade);
  })[0]; // Array.find in this case returns an array of [key, value] I ask for the key which is the grade
}

function generateClassRecordSummary(studentRecords) {
  let classSummary = {};
  let studentScores = Object.values(studentRecords).map((studentRecord) => studentRecord.scores );

  classSummary.studentGrades = compileStudentGrades(studentScores);
  classSummary.exams = compileExamData(studentScores);

  return classSummary;
}

function range(start, end) {
  return Array.from( { length: end - start + 1 }, function(key, value) {
    return start + value;
  } );
}

export { generateClassRecordSummary };