function getAllDirectAndIndirectChildren(document) {
  let [dataStructure, allElementsWithIDs] = initializeDataStructure(document);


}

function initializeDataStructure(document) {
  let dataStructure = {};
  let allElementsWithIDs = document.querySelectorAll('[id]:not([id=""])');
  let allIDs = Array.from(allElementsWithIDs).map(function(element) {
    return element.getAttribute('id');
  });

  allIDs.forEach(function(id) {
    dataStructure[id] = { direct: 0, indirect: 0 };
  });

  return [dataStructure, allElementsWithIDs];
}

export { initializeDataStructure, getAllDirectAndIndirectChildren };