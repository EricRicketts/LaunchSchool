function addChild(element, arr) {
  let children = last(arr);
  let parent = walkArray(element, children);
  last(parent).push([elementTagNameAndID(element), []]);
}

function addToArray(element, arr) {
  if (element.tagName === 'BODY') {
    arr.push('BODY', []);
  } else if (element.parentElement.tagName === 'BODY') {
    last(arr).push([elementTagNameAndID(element), []]);
  } else {
    addChild(element, arr);
  }
}

function elementTagNameAndID(element) {
  return `${element.tagName}#${element.getAttribute('id')}`;
}

function first(arr) {
  return arr[0];
}

function isParent(element, potentialParentTagAndID) {
  return elementTagNameAndID(element.parentElement) === potentialParentTagAndID;
}

function last(arr) {
  return arr[arr.length - 1];
}

function nodesToArr(document) {
  let arr = [];
  walkTree(document.body, arr)

  return arr;
}

function walkArray(element, arr) {
  for (let index = 0; index < arr.length; index += 1) {
    let potentialParent = arr[index];
    let potentialParentChildren = last(arr[index]);
    let potentialParentTagAndID = first(potentialParent);
    if (isParent(element, potentialParentTagAndID)) {
      return potentialParent;
    } else if (potentialParentChildren.length !== 0) {
      walkArray(element, potentialParentChildren);
    }
  }
}

function walkTree(element, arr) {
  addToArray(element, arr);
  for (let index = 0; index < element.children.length; index += 1) {
    walkTree(element.children[index], arr);
  }
}


export { nodesToArr };