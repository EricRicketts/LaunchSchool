function capitalizeBandName(bandName) {
  let newBandName = bandName.replace(/\./g, '');
  return newBandName.split(/\s/).map(function(word) {
     return word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase();
  }).join(' ');
}

function processBands(bandArray) {
  let copyBandArray = bandArray.slice().map(function(band) {
    let map = new Map(Object.entries(band));
    return Object.fromEntries(map);
  });

  return updateBands(copyBandArray);
}

function updateBands(bandArray) {
  return bandArray.map(function(band) {
    band.country = 'Canada';
    band.name = capitalizeBandName(band.name);
    return band;
  });
}

export { processBands };