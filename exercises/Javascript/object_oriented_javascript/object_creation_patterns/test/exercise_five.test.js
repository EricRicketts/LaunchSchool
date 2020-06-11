import { Account } from "../code/anonymizer";

describe('JS225 Object Oriented Design', function () {
  describe('Exercises Object Creation Patterns', function () {
    describe('Exercise Five', function () {
      let fooBar, results, expected;
      beforeEach(() => {
        fooBar = Object.create(Account).init('foo@bar.com', '123456', 'Foo', 'Bar');
      });

      it('firstName, lastName, and email properties should be functions', function () {
        results = [typeof fooBar.firstName, typeof fooBar.lastName, typeof fooBar.email];
        expected = ['function', 'function', 'function'];
        expect(results).toEqual(expected);
      });

      it('should have a displayName which is a random sequence of 16 characters', function () {
        expect(fooBar.displayName.length).toBe(16);
      });

      it('should reject a first name request with an invalid password', function () {
        expect(fooBar.firstName('abc')).toBe('Invalid password');
      });

      it('should provide a first name with the proper password', function () {
        expect(fooBar.firstName('123456')).toBe('Foo');
      });

      it('resetPassword requires a valid password', function () {
        expect(fooBar.resetPassword('123', 'abcdefg')).toBe('Invalid password');
      });

      it('resetPassword works with a valid password', function () {
        expect(fooBar.resetPassword('123456', 'abcdefg')).toBe(true);
      });

      it('should allow for reanonymize', function () {
        let lastDisplayName = fooBar.displayName;
        fooBar.reanonymize('123456');
        let currentDisplayName = fooBar.displayName;
        expect(lastDisplayName).not.toBe(currentDisplayName);
      });

      it('allows for the creation of multiple objects with their own set of private variables', function () {
        let bazQux = Object.create(Account).init('baz@qux.com', 'abcdefg', 'Baz', 'Qux');
        expect(bazQux.firstName('abcdefg')).toBe('Baz');
        expect(bazQux.email('foobar')).toBe('Invalid password');
      });
    });
  });
});