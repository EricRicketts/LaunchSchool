function delayLog() {
  let ary = [];
  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(n => {
    setTimeout(() => {
      ary.push(n);
    }, n * 1000);
  });
  return ary;
}

export { delayLog };