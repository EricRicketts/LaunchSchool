describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Closures and private Data', function () {
    let makeCounterLogger, range, makeList;
    beforeEach(() => {
      range = function(increase, firstElement, targetValue) {
        let length;
        if (increase) {
          length = targetValue - firstElement + 1;
          return Array.from({ length }, (_, i) => firstElement + i);
        } else {
          length = firstElement - targetValue + 1;
          return Array.from({ length}, (_, i) => firstElement - i);
        }
      }
      makeCounterLogger = function(start) {
        let increase = true;
        let firstElement = start;
        return function(targetValue) {
          let countValues = range(increase, firstElement, targetValue);
          increase = !increase;
          return countValues;
        }
      }
      makeList = function() {
        let todos = [];
        function processNoArgument() {
          if (todos.length === 0) {
            return 'The list is empty.'
          } else {
            return todos.join('\n');
          }
        }
        function processWithArgument(todoItem) {
          if (todos.includes(todoItem)) {
            let todoItemIndex = todos.indexOf(todoItem);
            todos.splice(todoItemIndex, 1);
            return todoItem + ' removed!';
          } else {
            todos.push(todoItem);
            return todoItem + ' added!';
          }
        }

        return function(todoItem) {
          return todoItem === undefined ? processNoArgument() : processWithArgument(todoItem);
        }
      }
    });
    it('should close over local variables increase and firstElement', function () {
      let countLog = makeCounterLogger(5);
      expect(countLog(8)).toEqual([5, 6, 7, 8]);
      expect(countLog(2)).toEqual([5, 4, 3, 2]);
    });

    it('should close over todo list', function () {
      let list = makeList();
      expect(list()).toBe('The list is empty.');
      expect(list('make breakfast')).toBe('make breakfast added!');
      expect(list('read book')).toBe('read book added!');
      expect(list()).toBe('make breakfast\nread book');
      expect(list('make breakfast')).toBe('make breakfast removed!');
      expect(list()).toBe('read book');
    });
  });
});