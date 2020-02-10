function staggeredCase(str) {
  return str.split('').map(function(char, idx) {
    return (idx % 2 === 0) ? char.toUpperCase() : char.toLowerCase();
  }).join('');
}

export { staggeredCase };