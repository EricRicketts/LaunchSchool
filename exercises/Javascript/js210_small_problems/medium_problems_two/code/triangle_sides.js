function isEquilateral(sideOne, sideTwo, sideThree) {
  return sideOne === sideTwo && sideTwo === sideThree;
}

function isInvalid(sides) {
  let min = Math.min(...sides);
  let max = Math.max(...sides);
  let sidesCopy = sides.slice();
  let idxOfMax = sidesCopy.indexOf(max);
  sidesCopy.splice(idxOfMax, 1);
  let sumOfMinValues = sidesCopy.reduce((sum, side) => sum + side);

  return (min === 0) || ( sumOfMinValues <= max);
}

function isIsosceles(sideOne, sideTwo, sideThree) {
  return (sideOne === sideTwo || sideTwo === sideThree || sideOne === sideThree);
}

function triangle(sideOne, sideTwo, sideThree) {
  let sides = [sideOne, sideTwo, sideThree];
  if (isInvalid(sides)) { return 'invalid'; }

  if (isEquilateral(sideOne, sideTwo, sideThree)) {
    return 'equilateral';
  } else if (isIsosceles(sideOne, sideTwo, sideThree)) {
    return 'isosceles';
  } else {
    return 'scalene';
  }
}

export { triangle };