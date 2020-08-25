function domTreeTracer(document, id) {
  let parentAndElementSiblings = [];
  let lowestLevelElement = document.getElementById(id);

  while (lowestLevelElement.tagName !== 'BODY') {
    let elementSiblings = getElementSiblings(lowestLevelElement);
    parentAndElementSiblings.push(elementSiblings);
    lowestLevelElement = lowestLevelElement.parentNode;
  }

  return parentAndElementSiblings;
}

function getElementSiblings(element) {
  let elementAndSiblings = [element.tagName];
  let currentElement = element.nextElementSibling;
  while (currentElement !== null) {
    elementAndSiblings.push(currentElement.tagName);
    currentElement = currentElement.nextElementSibling;
  }
  currentElement = element.previousElementSibling;
  while (currentElement !== null) {
    elementAndSiblings.push(currentElement.tagName);
    currentElement = currentElement.previousElementSibling;
  }

  return elementAndSiblings;
}

export { domTreeTracer };