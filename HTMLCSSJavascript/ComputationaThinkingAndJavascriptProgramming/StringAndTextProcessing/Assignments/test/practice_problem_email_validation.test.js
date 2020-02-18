import { isValidEmail } from "../code/email_validation";

describe('LS215 String And Text Processing Practice Problem Email Validation', function () {
  let str;
  it('should allow domain to have three parts', function () {
    str = 'Foo@baz.com.ph';
    expect(isValidEmail(str)).toBe(true);
  });

  it('should allow domain to have four parts', function () {
    str = 'Foo@mx.baz.com.ph';
    expect(isValidEmail(str)).toBe(true);
  });

  it('should allow domain to have two parts', function () {
    str = 'foo@baz.com';
    expect(isValidEmail(str)).toBe(true);
  });

  it('should allow domain to have two parts without official top level domain', function () {
    str = 'foo@baz.ph';
    expect(isValidEmail(str)).toBe(true);
  });

  it('should not allow domain to have one part', function () {
    str = 'HELLO123@baz';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should not allow local to have more than one part', function () {
    str = 'foo.bar@baz.to';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should not allow domain to have one part and a separator', function () {
    str = 'foo@baz.';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should not allow local to have anything but letters and digits', function () {
    str = 'foo_bat@baz';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should not allow domain to have anything but letters', function () {
    str = 'foo@bar.a12';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should not allow correct domain but incorrect local', function () {
    str = 'foo_bar@baz.com';
    expect(isValidEmail(str)).toBe(false);
  });

  it('should allow domain to have separators directly following one another', function () {
    str = 'foo@bar.....com';
    expect(isValidEmail(str)).toBe(false);
  });
});