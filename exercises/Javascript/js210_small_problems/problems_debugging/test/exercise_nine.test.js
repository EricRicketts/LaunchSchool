import { average, median, medianFixed } from "../code/grade_analysis";

describe('JS210 Small Problems Debugging Exercise Nine', function () {
  let quarter1ExamScores, quarter2ExamScores, quarter3ExamScores, quarter4ExamScores;
  let expectedAverage, expectedMedian, result;
  beforeEach(() => {
    quarter1ExamScores = [89, 72, 100, 93, 64, 97, 82, 87, 90, 94];
    quarter2ExamScores = [76, 91, 89, 90, 91, 67, 99, 82, 91, 87];
    quarter3ExamScores = [99, 91, 88, 72, 76, 64, 94, 79, 86, 88];
    quarter4ExamScores = [100, 94, 73, 88, 82, 91, 97, 99, 80, 84];
    expectedAverage = [86.8, 86.3, 83.7, 88.8];
    expectedMedian = [89.5, 89.5, 87, 89.5];
  });

  it('should give the average to one decimal place', function () {
    result = [average(quarter1ExamScores), average(quarter2ExamScores),
      average(quarter3ExamScores), average(quarter4ExamScores)];
    expect(result).toEqual(expectedAverage);
  });

  it('does not give the correct median values', function () {
    result = [median(quarter1ExamScores), median(quarter2ExamScores),
      median(quarter3ExamScores), median(quarter4ExamScores)];
    expect(result).not.toEqual(expectedMedian);
  });

  it('does give the correct median values', function () {
    result = [medianFixed(quarter1ExamScores), medianFixed(quarter2ExamScores),
      medianFixed(quarter3ExamScores), medianFixed(quarter4ExamScores)];
    expect(result).toEqual(expectedMedian);
  });
});