function isValidSwap(firstElement, secondElement) {
  return ((firstElement && secondElement) &&
      !firstElement.contains(secondElement) && !secondElement.contains(firstElement)
  )
}

function nodeSwap(document, id1, id2) {
  let swapped = undefined;
  let firstElement = document.getElementById(id1);
  let secondElement = document.getElementById(id2);

  if (isValidSwap(firstElement, secondElement)) {
    let clonedFirstElement = firstElement.cloneNode(true);
    let clonedSecondElement = secondElement.cloneNode(true);
    secondElement.parentNode.replaceChild(clonedFirstElement, secondElement);
    firstElement.parentNode.replaceChild(clonedSecondElement, firstElement);
    swapped = true;
  }

  return swapped;
}

export { nodeSwap };