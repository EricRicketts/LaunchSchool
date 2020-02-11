import { totalArea, totalSquareArea } from "../code/total_square_area";

describe('LS215 List Processing And Functional Abstractions Practice Problem One', function () {
  let rectangles, expected;
  beforeEach(() => {
    rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];
  });

  it('should calculate total area of a group of rectangles', function () {
    expected = 141;
    expect(totalArea(rectangles)).toBe(expected);
  });

  it('should filter out squares and add their total area', function () {
    expected = 121;
    expect(totalSquareArea(rectangles)).toBe(expected);
  });
});