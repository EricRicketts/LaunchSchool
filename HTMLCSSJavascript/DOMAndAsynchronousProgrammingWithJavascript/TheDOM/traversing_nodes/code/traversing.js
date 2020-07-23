let nodeArray = [];
function callBackFn(node) {
  nodeArray.push(node.constructor.name);
}

function walk(node, callback) {
  callback(node);
  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index], callback)
  }
}

export { nodeArray, callBackFn, walk };