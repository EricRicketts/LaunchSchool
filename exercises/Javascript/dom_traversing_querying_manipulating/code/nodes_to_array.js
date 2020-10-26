function nodesToArr(document) {
  /*
  so we pass in the document object, I have to do this since I am testing with JSDOM.  The first thing
  to do is to define an array with the 'BODY' tag and all of the children of the BODY element.  The
  function formatNodes is very simple it just takes the Array of HTML Elements (made an array from
  document.body.children by the Array slice method) and then maps each Element to an array containing that element.

  So in the first problem the nodesArray initializes to ['BODY', [[header element], [main element], [footer element]]];

  then currentParentNodes grabs the second element of the nodesArray which is the array of arrays
  currentParentNodes =  [[header element], [main element], [footer element]]

  the while loop is then entered, the anyChildren function checks if any children exist at all in the current
  parent array, if so it breaks out of the function and returns true.  In the case of the first html there are no
  children of the arrayed parents.  So we move onto the getNextGenerationParents of the currentParentNodes


  */
  const nodesArray = ['BODY', formatNodes(Array.prototype.slice.call(document.body.children))];
  let currentParentNodes = nodesArray[1];

  while (anyChildren(currentParentNodes)) {
    currentParentNodes = getNextGenerationParents(currentParentNodes);
  }

  getNextGenerationParents(currentParentNodes);

  return nodesArray;
}

function getNextGenerationParents(currentParentNodes) {
  let newParentNodes = [];
  currentParentNodes.forEach((parentNode, index, parentNodes) => {
    parentNodes[index] = appendChildren(parentNode);
    if (parentNodes[index][1].length > 0) {
      newParentNodes = newParentNodes.concat(parentNodes[index][1]);
    }
  });

  return newParentNodes;
}

function anyChildren(parentNodes) {
  for (let i = 0; i < parentNodes.length; i += 1) {
    if (parentNodes[i][0].children.length > 0) {
      return true;
    }
  }

  return false;
}

function appendChildren(parentNode) {
  const children = formatNodes(Array.prototype.slice.call(parentNode[0].children));
  parentNode[0] = parentNode[0].tagName;
  parentNode.push(children);
  return parentNode;
}

function formatNodes(nodes) {
  return nodes.map(node => [node]);
}

export { nodesToArr };