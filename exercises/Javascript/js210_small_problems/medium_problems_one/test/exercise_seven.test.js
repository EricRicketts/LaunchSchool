import { fibonacci } from "../code/fibonacci_procedural";

describe('JS210 Small Problems Medium One Exercise Seven', function () {
  it('should return the 0th Fibonacci Number as 0', function () {
    expect(fibonacci(0)).toBe(0);
  });

  it('should return the 1st Fibonacci Number as 1', function () {
    expect(fibonacci(1)).toBe(1);
  });

  it('should return the 2nd Fibonacci Number as 1', function () {
    expect(fibonacci(2)).toBe(1);
  });

  it('should return the 3rd Fibonacci Number as 2', function () {
    expect(fibonacci(3)).toBe(2);
  });

  it('should return the 4th Fibonacci Number as 3', function () {
    expect(fibonacci(4)).toBe(3);
  });

  it('should return the 20th Fibonacci Number as 6765', function () {
    expect(fibonacci(20)).toBe(6765);      
  });

  it('should return the 50th Fibonacci Number as 12586269025', function () {
    expect(fibonacci(50)).toBe(12586269025); 
  });

  it('should return the 75th Fibonacci Number as 2111485077978050', function () {
    expect(fibonacci(75)).toBe(2111485077978050);
  });
});