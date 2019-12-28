import { dateSuffix, formattedDate, formattedDay, formattedDayOfWeek,
  formattedMonth, formatTime, range } from "../code/date_object.js";

describe('Objects: Working With The Date Object', () => {
  var date, months, days, dayOfWeek, year, month, day, result, expected;
  var oneDayDifference, today, tomorrow;
  beforeEach(() => {
    date = new Date();
    months = range(0, 11, 1);
    days = range(1, 31, 1);
    dayOfWeek = range(0, 6, 1);
    oneDayDifference = 24*60*60*1000;
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

    it('getFullYear better than getYear', () => {
      date = new Date('2019-10-11');
      expect(date.getFullYear().toString()).toMatch(/\d{4}/);
      expect(date.getYear().toString()).toMatch(/\d{3}/);
      // after year 2000 getYear() only returns three digits
      // getFullYear return value is more intention revealing
    });
  });

  describe('Time formatting', () => {
    it('getTime should log milliseconds since Unix Epoch', () => {
      date = new Date('2019-12-16');
      var time = date.getTime();
      expect(Number.isInteger(time)).toBeTruthy();
      expect(time).toBeGreaterThan(10**12);
    });

    it('current day and next day are 24 hours apart', () => {
      date = new Date('2019-11-20UTC');
      today = new Date(date.getTime());
      tomorrow = new Date('2019-11-21UTC');
      tomorrow = new Date(tomorrow.getTime());
      expect(tomorrow.getTime() - today.getTime()).toBe(oneDayDifference);
      expected = 'Today\'s date is Wednesday, November 20th 2019';
      expect(formattedDate(tomorrow)).toBe(expected);
    });

    it('another way to verify 24 hours difference between today and tomorrow', () => {
        today = new Date();
        tomorrow = new Date(today.getTime());
        tomorrow.setDate(today.getDate() + 1);
        expect(tomorrow.getTime() - today.getTime()).toBe(oneDayDifference);
    });

    it('dates are only equal if they are copied from one another', () => {
      var d1 = new Date();
      var d2 = d1;
      expect(d1 === d2).toBeTruthy();
      d2 = new Date(d1.getTime());
      expect(d1 === d2).toBeFalsy();
    });

    it('moves to another week', () => {
      today = new Date('2019-11-7UTC');
      var nextWeek = new Date(today.getTime());
      nextWeek.setDate(today.getDate() + 7);
      expect(nextWeek.getTime() - today.getTime()).toBe(7*oneDayDifference);
    });

    it('formatTime for singled digits', () => {
      today = Date.UTC(2019, 11, 17, 3, 3, 0);
      today = new Date(today);
      expect(formatTime(today)).toBe('03:03');
    });

    it('formatTime for double digits', () => {
      today = Date.UTC(2019, 11, 17, 12, 35, 0);
      today = new Date(today);
      expect(formatTime(today)).toBe('12:35');
    });
  });
});