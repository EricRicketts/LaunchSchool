import { fibonacci } from "../code/fibonacci_recursion";

describe('JS210 Small Problems Medium One, Exercise Six', function () {
  it('should return 0th Fibonacci Number as 0', function () {
    expect(fibonacci(0)).toBe(0);
  });

  it('should return 1st Fibonacci Number as 1', function () {
    expect(fibonacci(1)).toBe(1);
  });

  it('should return 2nd Fibonacci Number as 1', function () {
    expect(fibonacci(2)).toBe(1);
  });

  it('should return 3rd Fibonacci Number as 2', function () {
    expect(fibonacci(3)).toBe(2);
  });

  it('should return the 4th Fibonacci Number as 3', function () {
    expect(fibonacci(4)).toBe(3);
  });

  it('should return the 5th Fibonacci Number as 5', function () {
    expect(fibonacci(5)).toBe(5);
  });

  it('should return the 6th Fibonacci Number as 8', function () {
    expect(fibonacci(6)).toBe(8);
  });

  it('should return the 12th Fibonacci Number as 144', function () {
    expect(fibonacci(12)).toBe(144);
  });

  it('should return the 20th Fibonacci Number as 6765', function () {
    expect(fibonacci(20)).toBe(6765);
  });
});