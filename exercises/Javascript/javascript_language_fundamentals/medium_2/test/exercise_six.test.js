describe('Exercises Javascript Language Fundamentals Medium Two Exercise Six', function () {
  var languages, expected;

  beforeEach(() => {
    languages = ['Javascript', 'Ruby', 'Python'];
  });

  it('length property explicitly sets the size of the array', function () {
    expected = ['Javascript', 'Ruby', 'Python'];
    expect(languages.toString()).toBe('Javascript,Ruby,Python');
    expect(languages.length).toBe(3);

    languages.length = 4;
    expect(languages.toString()).toBe('Javascript,Ruby,Python,');
    expect(languages.length).toBe(4);

    languages.length = 1;
    expect(languages.toString()).toBe('Javascript');
    expect(languages.length).toBe(1);

    languages.length = 3;
    expect(languages.toString()).toBe('Javascript,,');
    expect(languages.length).toBe(3);

    languages.length = 1;
    languages[2] = 'Python';
    expect(languages.toString()).toBe('Javascript,,Python');
    expect(languages[1]).toBeUndefined();
    expect(languages.length).toBe(3);
  });
});