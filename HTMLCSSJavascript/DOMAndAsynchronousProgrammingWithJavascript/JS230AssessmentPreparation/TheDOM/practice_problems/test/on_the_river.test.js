import * as path from 'path';
import * as fs from 'fs';
import { JSDOM } from 'jsdom';

describe('Traversing and Accessing Attributes', function () {
  let window, document, results, expected, walk;
  beforeEach(() => {
    walk = function(node, callback) {
      callback(node);
      for (let index = 0; index < node.childNodes.length; index += 1) {
        walk(node.childNodes[index], callback);
      }
    }
    let codeDirectory = path.join(__dirname, '..', 'code');
    let htmlFile = fs.readFileSync(codeDirectory + '/on_the_river.html', 'utf8');
    window = new JSDOM(htmlFile).window;
    document = window.document;
  });
  describe('Problems from the on_the_river.html', function () {
    it('should change the h1 to color red and font size to 48px', function () {
      let h1;
      let findH1 = function(node) {
        if (node.tagName === 'H1') { h1 = node; }
      }
      expected = [
        '2em',
        '',
        '48px',
        'rgb(255, 0, 0)'
      ];
      results = [
        window.getComputedStyle(document.querySelector('h1')).getPropertyValue('font-size'),
        window.getComputedStyle(document.querySelector('h1')).getPropertyValue('color'),
      ];
      walk(document.body, findH1);
      h1.style.fontSize = '48px';
      h1.style.color = 'rgb(255, 0, 0)';
      results.push(h1.style.fontSize, h1.style.color);
      expect(results).toEqual(expected);
    });

    it('Launch School solution for first problem', function () {
      /*
      I did not understand the problem, Launch School said to use only lastChild and childNodes
      properties to change the font size and color of the h1 element.  Launch School did this to
      emphasize the fact that document is the top most object in the DOM Hierarchy, so we can get
      to any element using this fact.
      JSDOM does not support getComputedStyle right now
      */
      expected = [
        '2em',
        '',
        '48px',
        'rgb(255, 0, 0)'
      ];
      results = [
        window.getComputedStyle(document.querySelector('h1')).getPropertyValue('font-size'),
        window.getComputedStyle(document.querySelector('h1')).getPropertyValue('color'),
      ];
      let html = document.childNodes[1]; // this skips <!doctype html>
      let body = html.lastChild; // this skips <head></head> and any text nodes and gives us body
      let h1 = body.childNodes[1]; // this skips the intervening text node
      h1.style.fontSize = '48px';
      h1.style.color = 'rgb(255, 0, 0)';
      results.push(h1.style.fontSize, h1.style.color);
      expect(results).toEqual(expected);
    });

    it('should count the paragraphs and store the result', function () {
      let count = 0;
      let counter = function(node) {
        if (node.nodeName === 'P') { count += 1; }
      }
      walk(document.body, counter);
      expect(count).toBe(5);
    });

    it('should retrieve the first word in each paragraph and put the results in an array', function () {
      expected = ['A', 'The', 'The', 'Where', 'And'];
      results = [];
      let getFirstWords = function(node) {
        if (node.nodeName === 'P') {
          results.push(node.firstChild.wholeText.match(/\w+/)[0]);
        }
      }
      walk(document.body, getFirstWords);
      expect(results).toEqual(expected);
    });

    it('should put the stanza class on every paragraph except the first', function () {
      expected = [true, 0, 4, true];
      results = [];
      let noClassesOnParagraphs = Array.from(document.getElementsByTagName('p')).every(p => p.classList.length === 0);
      results.push(noClassesOnParagraphs);
      let allParagraphs = [];
      function getAllParagraphs(node) {
        if (node.nodeName === 'P') { allParagraphs.push(node); }
      }
      function addStanzaClass(elementArray) {
        elementArray.slice(1).forEach(element => element.classList.add('stanza'));
      }
      function callback(node) {
        getAllParagraphs(node);
        addStanzaClass(allParagraphs);
      }
      walk(document.body, callback);
      results.push(document.querySelector('p').classList.length);
      let lastFourParagraphs = Array.from(document.getElementsByTagName('p')).slice(1);
      results.push(lastFourParagraphs.length);
      let stanzaClassCheck = lastFourParagraphs.every(p => p.classList.length === 1 && p.classList[0] === 'stanza');
      results.push(stanzaClassCheck);
      expect(results).toEqual(expected);
    });
  });
});
/*
  the last two problems referenced a Wikipedia page, so I decided run the code in the console.  The webpage was:
  https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html.  The first problem asked for the number of
  image elements and the second problem asked for the number of image elements which contained png files.

  let walk = function(node, callback) {
    callback(node);
    for (let index = 0; index < node.childNodes.length; index += 1) {
      walk(node.childNodes[index], callback);
    }
  }

  let allImages = [];
  let getAllImages = function(node) {
    if (node.nodeName === 'IMG') { allImages.push(node); }
  }
  walk(document.body, getAllImages);
  allImages.length === 48; // correct
  let allPNGImages = allImages.filter(img => /png/.test(img.src));
  allPNGImages === 23; // correct


  The second problem asked to change the link color of every link on the page to red.
  use the walk function above.
  let changeLinkColor = function(node) {
    if (node.nodeName === 'A') { node.style.color = 'red'; }
  }
  walk(document.body, changeLinkColor);
*/