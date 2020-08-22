const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { delegateEvent } from "../code/delegate_event_function";
const codeDirectory = path.join(__dirname, '..', 'code');

describe('Exercise Eight Delegate Event Functions', function () {
  let results, expected, treeWalker, window, document, arr, callbackResults,
    callback, element1, element2, element3, currentNode, checkListeners, nodeList;
  beforeEach(() => {
    arr = [];
    results = [];
    expected = [];
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    callback = ((event, arr) => {
      arr.push(`Target: ${event.target.tagName}\nCurrent Target: ${event.currentTarget.tagName}`);
    });
    const html = fs.readFileSync(codeDirectory + '/exercise_eight.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    element1 = document.querySelector('table');
    element2 = document.querySelector('main h1');
    element3 = document.querySelector('main');
    treeWalker = document.createTreeWalker(
      document.body,
      NodeFilter.SHOW_ELEMENT,
      { acceptNode(node) { return NodeFilter.FILTER_ACCEPT; } },
      false
    );
    checkListeners = (treeWalker => {
      let nodeList = [];
      currentNode = treeWalker.currentNode;
      while (currentNode) {
        if (currentNode.getAttribute('listener')) {
          nodeList.push(currentNode);
        }
        currentNode = treeWalker.nextNode();
      }
      return nodeList;
    });
  });

  it('Launch School Test Case One', function () {
    let delegateCallResults = delegateEvent(element1, 'p', 'click', callback, arr);

    expect(delegateCallResults).toBeUndefined();
  });

  it('Launch School Test Case Two', function () {
    /*
    This is an important test to run for me as I did not understand why in the problem statement that no callback
    would be triggered.  In order to prove that no callback was triggered I added an array to the delegateEvent
    function.  This array came back empty meaning even though the event handler was called the callback was never
    invoked.  The callback was never invoked because there were no children of the h1 element that were paragraph
    elements. 
    */
    expected = [true, 1, element2, []];
    results.push(delegateEvent(element2, 'p', 'click', callback, arr));
    element2.click();
    nodeList = checkListeners(treeWalker);
    results.push(nodeList.length, nodeList[0], arr);

    expect(results).toEqual(expected);
  });

  it('Launch School Test Case Three', function () {
    expected = [true, 1, element2, []];
    results.push(delegateEvent(element2, 'h1', 'click', callback, arr));
    element2.click();
    nodeList = checkListeners(treeWalker);
    results.push(nodeList.length, nodeList[0], arr);

    expect(results).toEqual(expected);
  });

  it('Launch School Test Case Four', function () {
    /*
    This was also another important test, I performed two clicks in the assertion function because
    I wanted to prove that a click whose element hierarchy did not include the targeted selector
    of the delegateEvent function would not invoke the callback function.  Thus after two clicks
    the array passed into the delegateEvent function would only contain one entry.
     */
    callbackResults = ['Target: H1\nCurrent Target: MAIN'];
    expected = [true, 1, element3, callbackResults];
    results.push(delegateEvent(element3, 'h1', 'click', callback, arr));
    element3.querySelector('section > h1').click();
    document.querySelector('main aside h2').click();
    nodeList = checkListeners(treeWalker);
    results.push(nodeList.length, nodeList[0], arr);

    expect(results).toEqual(expected);
  });

  it('Launch School Test Case Five', function () {
    callbackResults = ['Target: P\nCurrent Target: MAIN'];
    expected = [true, 1, element3, callbackResults];
    results.push(delegateEvent(element3, 'aside p', 'click', callback, arr));
    element3.querySelector('aside > p:last-child').click();
    document.querySelector('main > section > p').click();
    nodeList = checkListeners(treeWalker);
    results.push(nodeList.length, nodeList[0], arr);

    expect(results).toEqual(expected);
  });

  it('Launch School Test Case Six', function () {
    callbackResults = ['Target: P\nCurrent Target: H1'];
    expected = [true, 1, element2, []];
    results.push(delegateEvent(element2, 'p', 'click', callback, arr));
    element2.click();
    nodeList = checkListeners(treeWalker);
    results.push(nodeList.length, nodeList[0], arr);

    expect(results).toEqual(expected);
    const newP = document.createElement('P');
    const newContent = document.createTextNode('New Paragraph');
    newP.appendChild(newContent);
    element2.appendChild(newP);

    element2.querySelector('p').click();
    expected[expected.length - 1] = callbackResults;

    expect(results).toEqual(expected);
  });
});