function sequence(end) {
 var seq = [];

 for (let i = 1; i <= end; i += 1) { seq.push(i); }

 return seq;
}

export { sequence };