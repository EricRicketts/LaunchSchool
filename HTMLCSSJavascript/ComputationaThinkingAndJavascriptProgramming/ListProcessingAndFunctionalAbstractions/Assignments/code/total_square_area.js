function areaOfRect(rect) {
  return rect[0] * rect[1];
}

function isSquare(rect) {
  return rect[0] === rect[1];
}
function totalArea(arrOfRects) {
  return arrOfRects.reduce(function(totalArea, rect) {
    totalArea += areaOfRect(rect);
    return totalArea;
  }, 0);
}

function totalSquareArea(arrOfRects) {
  let squares = arrOfRects.filter(function(rect) {
    return isSquare(rect);
  });

  return totalArea(squares);
}

export {totalArea, totalSquareArea };