function colorGeneration(element, depth) {
  let depthCount = 0;
  if (depth === 0) { return; }
  walkDOMTreeAndColor(element, depth, depthCount);
}

function walkDOMTreeAndColor(element, depth, depthCount) {
  let children = element.children;
  depthCount += 1;
  for (let index = 0; index < children.length; index += 1) {
    let currentElement = children[index];
    if (depthCount === depth) {
      currentElement.classList.add('generation-color');
    }
    walkDOMTreeAndColor(currentElement, depth, depthCount);
  }
}

export { colorGeneration };