import { dateSuffix, formattedDate, formattedDay, formattedDayOfWeek,
  formattedMonth, range } from "../code/date_object.js";

describe('Objects: Working With The Date Object', () => {
  var date, months, days, dayOfWeek, year, month, day, result, expected;
  beforeEach(() => {
    date = new Date();
    months = range(0, 11, 1);
    days = range(1, 31, 1);
    dayOfWeek = range(0, 6, 1);
  });
  describe("provides a date object for today's date", () => {
    it('provides a year', () => {
      expect(date.getFullYear().toString()).toMatch(/\d{4}/);
    });

    it('provides a month', () => {
      expect(months).toContain(date.getMonth());
    });

    it('provides a day of the month', () => {
      expect(days).toContain(date.getDate());
    });

    it('provides a day of the week', () => {
      expect(dayOfWeek).toContain(date.getDay());
    });
  });

  describe('format the date into a string', () => {
    it('provides a formatted suffix for day of month ending in 1', () => {
      result = [];
      expected = ['st', 'st', 'st'];
      [1, 21, 31].forEach(n => {
        result.push(dateSuffix(n));
      });
      expect(result).toEqual(expected);
    });

    it('provides a formatted suffix for day of month ending in 2', () => {
      result = [];
      expected = ['nd', 'nd'];
      [2, 22].forEach(n => {
        result.push(dateSuffix(n));
      });
      expect(result).toEqual(expected);
    });

    it('provides a formatted suffix for day of month ending in 3', () => {
      result = [];
      expected = ['rd', 'rd'];
      [3, 23].forEach(n => {
        result.push(dateSuffix(n));
      });
      expect(result).toEqual(expected);
    });

    it('provides a formatted suffix for day of month not ending in 1, 2, or 3', () => {
      result = [];
      expected = ['th', 'th', 'th', 'th'];
      [5, 10, 11, 29].forEach(n => {
        result.push(dateSuffix(n));
      });
      expect(result).toEqual(expected);
    });

    it('formats a day of the month', () => {
      result = [];
      expected = ['1st', '22nd', '23rd', '11th', '12th', '13th', '25th', '31st'];
      [1, 22, 23, 11, 12, 13, 25, 31].forEach(n => {
        result.push(formattedDay(n))
      });
      expect(result).toEqual(expected);
    });

    it('formats the month', () => {
      result = [];
      expected = [
        'January', 'Februrary', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].forEach(n => {
        result.push(formattedMonth(n));
      });
      expect(result).toEqual(expected);
    });

    it('formats day of the week', () => {
      result = [];
      expected = [
        'Sunday', 'Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday', 'Saturday'
      ];
      [0, 1, 2, 3, 4, 5, 6].forEach(n => {
        result.push(formattedDayOfWeek(n));
      });
      expect(result).toEqual(expected);
    });

    it('fully formats a year, month, and day', () => {
      date = new Date('2019-12-2');
      expected = "Today's date is Monday, December 2nd 2019";
      expect(formattedDate(date)).toBe(expected);
    });
  });
});