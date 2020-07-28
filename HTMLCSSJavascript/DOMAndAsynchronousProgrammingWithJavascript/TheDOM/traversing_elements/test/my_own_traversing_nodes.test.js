const fs = require('fs');
const path = require('path');
const jsdom = require('jsdom');
const { JSDOM } = jsdom;

describe('My Own Exercises Traversing Elements And Nodes', function () {
  let document, Node, results, expected;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    let html = fs.readFileSync(codeDirectory + '/third.html', 'utf8');
    let window = new JSDOM(html).window;
    document = window.document;
    let Document = Object.getPrototypeOf(document);
    Node = Object.getPrototypeOf(Document);
  });

  describe('Traversing using querySelectorAll which returns a NodeList', function () {
    let ulNodeList, ulNodeListAndChildren;
    beforeEach(() => {
      ulNodeList = document.querySelectorAll('#unordered');
      ulNodeListAndChildren = document.querySelectorAll('#unordered, #unordered *');
    });

    it('querySelectorAll returns a NodeList', function () {
      expect(ulNodeList.constructor.name).toBe('NodeList');
    });

    it('queried single elements have no children', function () {
      expect(ulNodeList.childNodes).toBeUndefined();
    });

    it('query needs to use appropriate CSS to get children', function () {
      /*
      ul element: 1
      immediate li: 3
      last li has ol: 1
      immediate li's of ol: 3
      total: 8
      Note: One might wonder since querySelectorAll returns a NodeList why are there not any text nodes?
      The reason for this is that the returned NodeList is based on the DOMString based CSS selector.  So, in this
      case no text nodes are selected as a matter of fact I would not know how get the text nodes via a query
       */
      expect(ulNodeListAndChildren.length).toBe(8);
    });

    it('We can query for the child nodes once we get a starting element', function () {
      let ulElement = ulNodeListAndChildren.item(0);
      let ulElementChildren = ulElement.childNodes;
      expect(ulElementChildren.length).toBe(7);
      let numberOfTextNodes = Array.from(ulElementChildren).filter(node => node.nodeType === Node.TEXT_NODE);
      expect(numberOfTextNodes.length).toBe(4);
    });

    it('childNodes gives all Nodes whether text or element, children only give element nodes', function () {
      results = []
      expected = [7, 4, 3, true];
      let olElement = Array.from(ulNodeListAndChildren).find(node => node.nodeName === 'OL');
      results.push(olElement.childNodes.length);
      let textNodes = Array.from(olElement.childNodes).filter(node => node.nodeType === Node.TEXT_NODE);
      results.push(textNodes.length);
      results.push(olElement.children.length);
      let allElements = Array.from(olElement.children).every(node => node.nodeType === Node.ELEMENT_NODE);
      results.push(allElements);
      expect(results).toEqual(expected);
    });

    it('In a NodeList text nodes can be siblings of an element node', function () {
      expected = ['#text', '#text', 'UL'];
      let middleLi = ulNodeListAndChildren.item(2);
      results = [middleLi.previousSibling.nodeName, middleLi.nextSibling.nodeName, middleLi.parentNode.nodeName];
      expect(results).toEqual(expected);
    });

    it('nextElementSibling and previousElementSibling return non element nodes', function () {
      expected = ['LI', 'LI'];
      let middleLi = ulNodeListAndChildren.item(2);
      results = [middleLi.previousElementSibling.nodeName, middleLi.nextElementSibling.nodeName];
      expect(results).toEqual(expected);
    });

    it('children property returns element children', function () {
      let allElementSiblings = Array.from(ulNodeListAndChildren.item(0).children).every(node => {
        return node.nodeType === Node.ELEMENT_NODE;
      });
      expect(allElementSiblings).toBe(true);
    });
  });

  describe('Using getElementBy methods', function () {
    let topUL, ulLIs;
    beforeEach(() => {
      topUL = document.getElementById('unordered');
      ulLIs = document.getElementsByClassName('un_li');
    });

    it('getElementById returns single Element', function () {
      expect(Object.getPrototypeOf(topUL).constructor.name).toBe('HTMLUListElement');
    });

    it('once we isolate an element we can always get any children, no matter the query method', function () {
      expected = [3, 3];
      results = [topUL.childElementCount, document.querySelector('#unordered').childElementCount];
      expect(results).toEqual(expected);
    });

    it('should return an HTMLCollection of first level list items', function () {
      expect(Array.from(ulLIs).every(node => node.nodeName === 'LI')).toBe(true);
    });
  });
});