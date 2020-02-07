import { myMap } from "../code/my_map";

describe('Transformation Lesson My Own Map Function', function () {
  let count, double, plusOne, getBooksTitle, getTitle, books, expected;
  beforeEach(() => {
    count = [1, 2, 3, 4, 5];
    double = function(n) { return 2*n; };
    plusOne = function(n) { return n + 1; };
    getTitle = function (book) {
      return book.title;
    };
    books = [
      {
        title: 'JavaScript and JQuery: Interactive Front-End Web Development',
        author: 'Jon Ducket',
        edition: '1st',
      },
      {
        title: 'Eloquent JavaScript: A Modern Introduction to Programming',
        author: 'Haverbeke',
        edition: '2nd',
      },
      {
        title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
        author: 'Jennifer Niederst Robbins',
        edition: '4th',
      },
    ];
  });

  it('standard map will double each number in an array', function () {
    expected = [2, 4, 6, 8, 10];
    expect(count.map(double)).toEqual(expected);
  });

  it('standard map will increment each number in an array by one', function () {
    expected = [2, 3, 4, 5, 6];
    expect(count.map(plusOne)).toEqual(expected);
  });

  it('standard map will return all of the book titles from a list of books', function () {
    getBooksTitle = function(books) { return books.map(getTitle); };
    expected = [
      "JavaScript and JQuery: Interactive Front-End Web Development",
      "Eloquent JavaScript: A Modern Introduction to Programming",
      "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
    ];
    expect(getBooksTitle(books)).toEqual(expected);
  });

  it('my own map will double each number in an array', function () {
    expected = [2, 4, 6, 8, 10];
    expect(myMap(count, double)).toEqual(expected);
  });

  it('my own myMap will increment each number in an array by one', function () {
    expected = [2, 3, 4, 5, 6];
    expect(myMap(count, plusOne)).toEqual(expected);
  });

  it('my own myMap will return all of the book titles from a list of books', function () {
    getBooksTitle = function(books) { return myMap(books, getTitle); };
    expected = [
      "JavaScript and JQuery: Interactive Front-End Web Development",
      "Eloquent JavaScript: A Modern Introduction to Programming",
      "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
    ];
    expect(getBooksTitle(books)).toEqual(expected);
  });
});