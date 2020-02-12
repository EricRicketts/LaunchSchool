import { generateClassRecordSummary } from "../code/class_record_summary";

describe('LS215 List Processing And Functional Abstractions Practice Problem Six', function () {
  let studentScores, result, expected;
  beforeEach(() => {
    studentScores = {
      student1: {
        id: 123456789,
        scores: {
          exams: [90, 95, 100, 80],
          exercises: [20, 15, 10, 19, 15],
        },
      },
      student2: {
        id: 123456799,
        scores: {
          exams: [50, 70, 90, 100],
          exercises: [0, 15, 20, 15, 15],
        },
      },
      student3: {
        id: 123457789,
        scores: {
          exams: [88, 87, 88, 89],
          exercises: [10, 20, 10, 19, 18],
        },
      },
      student4: {
        id: 112233445,
        scores: {
          exams: [100, 100, 100, 100],
          exercises: [10, 15, 10, 10, 15],
        },
      },
      student5: {
        id: 112233446,
        scores: {
          exams: [50, 80, 60, 90],
          exercises: [10, 0, 10, 10, 0],
        },
      },
    };
    expected = {
      studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
      exams: [
        { average: 75.6, minimum: 50, maximum: 100 },
        { average: 86.4, minimum: 70, maximum: 100 },
        { average: 87.6, minimum: 60, maximum: 100 },
        { average: 91.8, minimum: 80, maximum: 100 },
      ],
    };
  });

  it('should meets problem requirements', function () {
    result = generateClassRecordSummary(studentScores);
    expect(result).toEqual(expected);
  });
});