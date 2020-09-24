import { walkTree } from "../code/walk_tree";
import {walk} from "../../../TheDOM/traversing_nodes/code/traversing";
const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');

describe('Walking A DOM Tree And Classifying Nodes', function () {
  let document, results, expected, countNodeTypes, nodeTypeCount, html, Node;
  beforeEach(() => {
    nodeTypeCount = { comment: 0, element: 0, text: 0 };
    let options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    let codeDirectory = path.join(__dirname, '..', '/code');
    let htmlFile = fs.readFileSync(codeDirectory + '/hierarchy_of_nodes.html', 'utf8');
    let window = new JSDOM(htmlFile, options).window;
    document = window.document;
    html = document.querySelector('html');
    Node = Object.getPrototypeOf(Object.getPrototypeOf(document));
    countNodeTypes = function(node) {
      switch (node.nodeType) {
        case Node.ELEMENT_NODE: {
          nodeTypeCount.element += 1;
          break;
        }
        case Node.TEXT_NODE: {
          nodeTypeCount.text += 1;
          break;
        }
        case Node.COMMENT_NODE: {
          nodeTypeCount.comment += 1;
          break;
        }
      }
    }
  });

  it('should count all of the nodes in the markup', function () {
    let nodeCount = 0;
    walkTree(html, () => nodeCount += 1);
    expect(nodeCount).toBe(42);
  });

  it('should classify all the node types', function () {
    expected = { comment: 1, element: 15, text: 26 };
    walkTree(html, countNodeTypes);
    expect(nodeTypeCount).toEqual(expected);
    let totalNodes = Object.values(nodeTypeCount).reduce((sum, value) => sum + value, 0);
    expect(totalNodes).toBe(42);
  });

  it('should find all of the children of the first paragraph node', function () {
    let p = document.querySelector('body > p');
    expect(p.childNodes.length).toBe(3);
    results = [
      p.childNodes.length, p.childNodes[0].nodeType,
      p.childNodes[1].nodeType, p.childNodes[2].nodeType, p.childNodes[1].nodeName
    ];
    expected = [3, Node.TEXT_NODE, Node.ELEMENT_NODE, Node.TEXT_NODE, 'A'];
    expect(results).toEqual(expected);
  });

  it('we can find the adjacent nodes of a given node', function () {
    let form = document.querySelector('form');
    let label = form.querySelector('label');
    let p = form.querySelector('p');
    results = [
      form.childNodes.length, label.previousSibling.nodeType, label.nextSibling.nodeType,
      p.previousSibling.nodeType, p.nextSibling.nodeType
    ];
    expected = [5, Node.TEXT_NODE, Node.TEXT_NODE, Node.TEXT_NODE, Node.TEXT_NODE];
    expect(results).toEqual(expected);
    expect(label.nextSibling).toBe(p.previousSibling);
  });
});