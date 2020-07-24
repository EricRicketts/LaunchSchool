let fs = require('fs');
let path = require('path');
let jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('Element Attributes', function () {
  let document, results, expected;   
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let htmlFile = fs.readFileSync(codeDirectory + '/element_attributes.html', 'utf8');
    let window = new JSDOM(htmlFile).window;
    document = window.document
  });

  describe('Attribute getters and setters', function () {
    it('getAttribute should return the value of the named attribute', function () {
      results = document.getElementsByTagName('h1').item(0).getAttribute('id');
      expect(results).toBe('header');
    });

    it('hasAttribute returns a boolean indicating existence of attribute on the element', function () {
      let h1 = document.getElementsByTagName('h1').item(0);
      expected = [true, false];
      results = [h1.hasAttribute('id'), h1.hasAttribute('class')];
      expect(results).toEqual(expected);
    });

    it('setAttribute allows attributes to be added on elements', function () {
      results = [];
      expected = [false, true, 'foo'];
      let paragraph = document.getElementsByTagName('p').item(0);
      results.push(paragraph.hasAttribute('id'));
      paragraph.setAttribute('id', 'foo');
      results.push(paragraph.hasAttribute('id'), paragraph.getAttribute('id'));
      expect(results).toEqual(expected);
    });

    it('setAttribute allows attributes to be updated', function () {
      results = [];
      expected = ['header', 'newHeader'];
      let h1 = document.getElementsByTagName('h1').item(0);
      results.push(h1.getAttribute('id'));
      h1.setAttribute('id', 'newHeader');
      results.push(h1.getAttribute('id'));
      expect(results).toEqual(expected);
    });
  });

  describe('Direct Attribute properties', function () {
    it('id property on an element can be used as a getter and a setter', function () {
      results = [];
      expected = ['header', 'newHeader'];
      let h1 = document.getElementsByTagName('h1').item(0);
      results.push(h1.id);
      h1.id = 'newHeader';
      results.push(h1.id);
      expect(results).toEqual(expected);
    });

    it('className returns a string of all classes on the element', function () {
      let button = document.getElementsByTagName('button').item(0);
      expect(button.className).toBe('btn btn-lg btn-primary');
    });
  });

  describe('classList property', function () {
    let button, classes;
    beforeEach(() => {
      button = document.querySelector('button');
      classes = button.classList;
    })
    it('classList returns a DOMTokenList', function () {
      expect(button.classList.constructor.name).toBe('DOMTokenList');
    });

    it('should contain all classes on element which are iterable', function () {
      let classNamesIterator = classes.values();
      expected = ['btn', 'btn-lg', 'btn-primary'];
      results = Array.from(classNamesIterator).reduce((classNames, className) => {
        classNames.push(className);
        return classNames;
      }, []);
      expect(results).toEqual(expected);
    });

    it('add allows another class name to be added to the element', function () {
      button.classList.add('btn-sm');
      expect(button.classList.length).toBe(4);
    });

    it('remove removes the given class name from the element', function () {
      button.classList.remove('btn-lg');
      expect(button.classList.length).toBe(2);
    });

    it('toggle adds or removes a class name depending on whether it exists', function () {
      button.classList.toggle('btn');
      expect(button.classList.length).toBe(2);
      button.classList.toggle('btn');
      expect(button.classList.length).toBe(3);
    });

    it('contains returns boolean depending on whether the class name exists', function () {
      expected = [true, false];
      results = [button.classList.contains('btn-primary'), button.classList.contains('btn-sm')];
      expect(results).toEqual(expected);
    });
  });
});