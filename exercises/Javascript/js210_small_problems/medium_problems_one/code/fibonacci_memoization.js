function fibonacci(n) {
  var memo = {};
  if (n < 2) {
    return [0, 1][n]
  } else if (memo[n]) {
    return memo[n];
  } else {
    memo[n] = (function(n) {
      return fibonacci(n - 1) + fibonacci(n - 2);
    }(n));
    return memo[n];
  }
}

export { fibonacci };