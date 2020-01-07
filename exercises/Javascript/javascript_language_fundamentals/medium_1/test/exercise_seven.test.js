import { invoiceTotalFirst, invoiceTotalSecond } from '../code/invoice.js'
describe('Exercises: Javascript Langauge Fundamentals: Medium One: Exercise Seven', function () {
  it('provide exact number of arguments, function works as expected', function () {
    expect(invoiceTotalFirst(20, 30, 40, 50)).toBe(140);
  });

  it('excess arguments are ignored', function () {
    var result = invoiceTotalFirst(20, 30, 40, 50, 40, 40);
    expect(result).toBe(140);
  });

  it('use arguments variable to capture any amount of arguments', function () {
    var result = invoiceTotalSecond(20, 30, 40, 50, 40, 40);
    expect(result).toBe(220);
  });
});