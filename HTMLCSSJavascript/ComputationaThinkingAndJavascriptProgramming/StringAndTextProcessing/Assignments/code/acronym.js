function acronym(str) {
  return str.split(/[\s\-]+/).map((word) => word[0].toUpperCase() ).join('');
}

function acronymAlternate(str) {
  let words = str.split(/[\s\-]+/);
  let initials = words.map((word) => word[0].toUpperCase() );

  return initials.join('');
}

export { acronym, acronymAlternate };
/*
I had the second version because the Launch School solution
made a point about readability
 */