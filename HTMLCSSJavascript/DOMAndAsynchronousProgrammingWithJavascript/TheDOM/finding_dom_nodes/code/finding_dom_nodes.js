function walkTree(node, callback, value) {
  callback(node, value);

  let nodes = node.childNodes;
  for (let index = 0; index < nodes.length; index += 1) {
    walkTree(nodes[index], callback, value);
  }
}

export { walkTree };