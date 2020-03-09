function isInvalid(angles) {
  let sumOfAngles = angles.reduce((sum, angle) => sum + angle);

  return angles.some((angle) => angle === 0) || sumOfAngles !== 180;
}

function triangles(angleOne, angleTwo, angleThree) {
  let angles = [angleOne, angleTwo, angleThree];
  if (isInvalid(angles)) { return 'invalid'; }

  if (angles.includes(90)) {
    return 'right';
  } else if (angles.some((angle) => angle > 90)) {
    return 'obtuse';
  } else {
    return 'acute';
  }
}

export { triangles };