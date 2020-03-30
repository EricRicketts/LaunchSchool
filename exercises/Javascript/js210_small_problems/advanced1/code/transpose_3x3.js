function transpose(arr) {
  return arr.map((_, idx, orig) => [orig[0][idx], orig[1][idx], orig[2][idx]] );
}

export { transpose };