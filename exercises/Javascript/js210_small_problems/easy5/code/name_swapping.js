function swapName(str) {
  return str.split(/\s+/).reverse().join(', ');
}

export { swapName };