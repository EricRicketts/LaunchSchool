import { pomodoro } from "../code/pomdoro";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Five', function () {
  it('function does not work, local variable shadows globally scoped variable', function () {
    expect(pomodoro()).toBe(undefined);
  });
});