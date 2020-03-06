import { minilang } from "../code/stack_machine";

describe('JS210 Small Problems Medium One Exercise Four', function () {
 let instructions, expected;
  it('should print the value of the initialized register', function () {
    instructions = 'PRINT';
    expected = [0];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should multiply 5 by 3', function () {
    instructions = '5 PUSH 3 MULT PRINT';
    expected = [15];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should add 5 and 3', function () {
    instructions = '5 PRINT PUSH 3 PRINT ADD PRINT';
    expected = [5, 3, 8];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should push and pop a value from the stack', function () {
    instructions = '5 PUSH POP PRINT';
    expected = [5];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should add 5 and 5 then add 3 and 4', function () {
    instructions = '3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT';
    expected = [5, 10, 4, 7];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should integer divide 7 by 3 and then multiply the result by 3', function () {
    instructions = '3 PUSH PUSH 7 DIV MULT PRINT';
    expected = [6];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should calculate 7 mod 4 times 4', function () {
    instructions = '4 PUSH PUSH 7 MOD MULT PRINT';
    expected = [12];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should subtract two numbers', function () {
    instructions = '-3 PUSH 5 SUB PRINT';
    expected = [8];
    expect(minilang(instructions)).toEqual(expected);
  });

  it('should return nothing if register values is not queried', function () {
    instructions = '6 PUSH';
    expected = [];
    expect(minilang(instructions)).toEqual(expected);
  });
});