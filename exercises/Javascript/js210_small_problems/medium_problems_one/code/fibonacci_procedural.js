function fibonacci(n) {
  let fibNumbers = range(0, n);
  return fibNumbers.reduce((sequence, number, i) => {
    if (number < 2) {
      sequence.push([0, 1][number]);
    } else {
      sequence.push(sequence[i - 2] + sequence[i - 1]);
    }

    return sequence;
  }, [])[n];
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

export { fibonacci };