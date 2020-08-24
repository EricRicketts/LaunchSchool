function countIndirectChildNodes(element, nodeCount, currentId, document) {
  let topLevelElement = document.getElementById(currentId);
  for (let index = 0; index < element.childNodes.length; index += 1) {
    let childNode = element.childNodes[index];
    if (!Array.from(topLevelElement.childNodes).includes(childNode)) {
      nodeCount[currentId].indirect += 1;
    }
    countIndirectChildNodes(childNode, nodeCount, currentId, document);
  }
}

function childNodes(document , id = undefined) {
  let nodeCount = {};
  let elementsWithIDs = Array.from(document.querySelectorAll("[id]"));
  elementsWithIDs.forEach(element => {
    let currentID = element.getAttribute('id');
    nodeCount[currentID] = { direct: element.childNodes.length, indirect: 0 };
    countIndirectChildNodes(element, nodeCount, currentID, document);
  });

  return id ? Object.values(nodeCount[id]) : nodeCount;
}

export { childNodes };