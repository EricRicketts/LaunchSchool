function isBalanced(str) {
  let strSize = str.length;
  let sum = 0;

  for (let i = 0; i < strSize; i += 1) {
    if (str[i] === '(') {
      sum += 1;
    } else if (str[i] === ')') {
      sum -= 1;
    }
    if (sum < 0) {
      return false;
    }
  }

  return sum === 0;
}

export { isBalanced };