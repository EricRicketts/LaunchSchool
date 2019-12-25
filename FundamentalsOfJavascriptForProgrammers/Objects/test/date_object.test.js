describe('Objects: Working With The Date Object', () => {
  var date, months, days, dayOfWeek, range;
  beforeEach(() => {
    date = new Date();
    range = function(start, stop, step) {
      return Array.from({ length: (stop - start)/step + 1 }, function(_, i) {
        return start + (i * step);
      });
    }
    months = range(0, 11, 1);
    days = range(1, 31, 1);
    dayOfWeek = range(0, 6, 1);
  });
  describe("provides a date object for today's date", () => {
    it('provides a year', () => {
      expect(Number.isInteger(date.getFullYear())).toBeTruthy();
    });
    it('provides a month', () => {
      
    });
  });
});