function fibonacci(n) {
  if (n < 2) {
    return [0, 1][n];
  } else {
    return fibonacci(n - 2) + fibonacci(n - 1);
  }
}

export { fibonacci };