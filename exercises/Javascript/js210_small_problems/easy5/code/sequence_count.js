function sequence(iterations, incr) {
  var seq = [];

  for(let i = 1; i <= iterations; i += 1) { seq.push(i*incr); }

  return seq;
}

export { sequence };