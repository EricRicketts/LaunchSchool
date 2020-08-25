function sliceTree(document, start, end) {
  let slicedTreeTags = [];
  let topLevelElement = document.getElementById(start);
  let innerMostChildElement = document.getElementById(end);

  if (!topLevelElement || !innerMostChildElement) {
    return undefined;
  }

  let treeWalker = document.createTreeWalker(
    topLevelElement,
    NodeFilter.SHOW_ELEMENT,
    { acceptNode(node) { return NodeFilter.FILTER_ACCEPT; } }, false
  );

  treeWalker.currentNode = innerMostChildElement;
  let currentElement = treeWalker.currentNode;
  do {
    slicedTreeTags.push(currentElement.tagName);
    currentElement = treeWalker.parentNode();
  } while (currentElement !== null && currentElement !== document.body);

  return currentElement === document.body ? undefined : slicedTreeTags.reverse();
}

export { sliceTree };