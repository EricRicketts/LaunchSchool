import { memberDirectory, clearMemberDirectory, addMember, addMemberFix } from "../code/member_directory";

describe('JS210 Small Problems Debugging Exercise Six', function () {
  let name, number, expected;
  beforeEach(() => {
    clearMemberDirectory();
  });

  it('should incorrectly allow a digit in the name', function () {
    name = 'Foo1bar Fizzbuzz';
    number = '345-6644';
    expected = { 'Foo1bar Fizzbuzz': '345-6644' };
    addMember(name, number);
    expect(memberDirectory).toEqual(expected);
  });

  it('should incorrectly allow an underscore in the name', function () {
    name = 'El_mer Fudd';
    number = '451-0235';
    addMember(name, number);
    expected = { 'El_mer Fudd': '451-0235' };
    expect(memberDirectory).toEqual(expected);
  });

  it('should now reject an name with a digit', function () {
    name = 'Foo1bar Fizzbuzz';
    number = '345-6644';
    expect(addMemberFix(name, number)).toBe('Invalid member information');
  });

  it('should now reject an name with an underscore', function () {
    name = 'El_mer Fudd';
    number = '451-0235';
    expect(addMemberFix(name, number)).toBe('Invalid member information');
  });

  it('should add a new member', function () {
    name = 'Elmer Fudd';
    number = '451-0235';
    expected = { 'Elmer Fudd': '451-0235' };
    addMemberFix(name, number);
    expect(memberDirectory).toEqual(expected);
  });
});