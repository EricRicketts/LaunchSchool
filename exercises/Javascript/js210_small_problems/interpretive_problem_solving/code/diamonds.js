const STAR = '*';
function diamond(gridSize) {
  if (gridSize < 1 || (gridSize % 2 === 0)) {
    throw new RangeError('grid size must be larger than zero and odd.');
  } else if (gridSize === 1) {
    return STAR.concat("\n");
  } else {
    return makeDiamond(gridSize);
  }
}

function makeDiamond(gridSize) {
  let upperHalf = makeUpperHalf(gridSize);
  let middle = STAR.repeat(gridSize).concat("\n");
  let lowerHalf = upperHalf.slice().reverse();

  return upperHalf.join('') + middle + lowerHalf.join('');
}

function makeUpperHalf(gridSize) {
  let rows = [];
  let maxSpacings = Math.floor(gridSize/2);

  for (let spaces = maxSpacings; spaces >= 1; spaces -= 1) {
    let emptyString = '';
    let padding = emptyString.padStart(spaces, ' ');
    let stars = STAR.repeat(gridSize - 2*spaces);

    let row = padding + stars + padding + "\n";
    rows.push(row);
  }

  return rows;
}

export { diamond };