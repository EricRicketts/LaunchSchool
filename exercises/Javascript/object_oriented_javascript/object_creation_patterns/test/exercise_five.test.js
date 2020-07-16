import { Account } from "../code/anonymizer";

describe('JS225 Object Oriented Design', function () {
  describe('Exercises Object Creation Patterns', function () {
    describe('Exercise Five', function () {
      let fooBar, fooBarPassword, bazQux, bazQuxPassword, results, expected;
      beforeEach(() => {
        fooBar = Object.create(Account).init('foo@bar.com', 'Linus_2_valds',
          'Foo', 'Bar');
        bazQux = Object.create(Account).init('baz@qux.com', 'Dhh_4_rails',
          'Baz', 'Qux');
        fooBarPassword = 'Linus_2_valds';
        bazQuxPassword = 'Dhh_4_rails';
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
        expect(fooBar.firstName(fooBarPassword)).toBe('Foo');
      });

      it('resetPassword requires a valid password', function () {
        expect(fooBar.resetPassword('123', 'abcdefg')).toBe('Invalid password');
      });

      it('resetPassword works with a valid password', function () {
        expect(fooBar.resetPassword(fooBarPassword, 'abcdefg')).toBe(true);
      });

      it('should allow for reanonymize', function () {
        let lastDisplayName = fooBar.displayName;
        fooBar.reanonymize(fooBarPassword);
        let currentDisplayName = fooBar.displayName;
        expect(lastDisplayName).not.toBe(currentDisplayName);
      });

      it('allows for the creation of multiple objects with their own set of private variables', function () {
        expected = ['foo@bar.com', 'baz@qux.com'];
        results = [fooBar.email(fooBarPassword), bazQux.email(bazQuxPassword)];
        expect(results).toEqual(expected);
      });
    });
  });
});