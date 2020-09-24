function walkTree (node, callback) {
  callback(node);
  for (let index = 0; index < node.childNodes.length; index += 1) {
    walkTree(node.childNodes[index], callback);
  }
}

export { walkTree };