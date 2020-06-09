function delegate(obj, methodName, ...args) {
  return function() {
    return obj[methodName].call(obj, ...args);
  }
}
export { delegate };