const STAR = '*';
const SPACE = ' ';

function makeSpacingArray(gridSize) {
  let largestIndex = Math.floor(gridSize/2) - 1;

  return range(0, largestIndex);
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

function star(gridSize) {
  if (gridSize <= 3 || gridSize % 2 === 0) {
    throw new RangeError('The argument must be odd and greater than 3.');
  }

  let spacingArray = makeSpacingArray(gridSize);
  let upperHalf = starUpperHalf(spacingArray);
  let middleRow = starMiddleRow(gridSize);
  let lowerHalf = starLowerHalf(upperHalf);

  return upperHalf.join('') + middleRow + lowerHalf.join('');
}

function starLowerHalf(upperHalf) {
  return upperHalf.slice().reverse();
}

function starMiddleRow(gridSize) {
  return  STAR.repeat(gridSize).concat("\n");
}

function starUpperHalf(spacingArray) {
  let maxInnerSpaces = spacingArray.length - 1;

  return spacingArray.reduce((upperHalf, outerSpaceSize) => {
    let innerSpaceSize = maxInnerSpaces - outerSpaceSize;
    let starRow = SPACE.repeat(outerSpaceSize) + STAR + SPACE.repeat(innerSpaceSize) + STAR +
      SPACE.repeat(innerSpaceSize) + STAR + SPACE.repeat(outerSpaceSize);

    starRow = starRow.concat("\n");
    upperHalf.push(starRow);
    return upperHalf;
  }, []);
}

export { star };