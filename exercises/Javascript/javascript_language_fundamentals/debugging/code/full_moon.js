// var species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
// var isMidnight = true;
// var isFullmoon = true;

function isTransformable(species) {
  return species[0] === 'w';
}

function transform(species) {
  return 'were' + species;
}

function getSpooked(species, isMidnight, isFullMoon) {
  var spooked = [];
  var i;
  for (i = 0; i < species.length; i++) {
    var thisSpecies = species[i];
    var newSpecies;

    if (isMidnight && isFullMoon && isTransformable(thisSpecies)) {
      newSpecies = transform(thisSpecies);
    }

    if (newSpecies) {
      // console.log('Beware of the ' + newSpecies + '!');
      spooked.push('Beware of the ' + newSpecies + '!');
    }
  }

  return spooked;
}

function getSpookedFixed(species, isMidnight, isFullMoon) {
  var spooked = [];
  var i;
  for (i = 0; i < species.length; i++) {
    var thisSpecies = species[i];
    var newSpecies;

    if (isMidnight && isFullMoon && isTransformable(thisSpecies)) {
      newSpecies = transform(thisSpecies);
    } else {
      newSpecies = false;
    }

    if (newSpecies) {
      // console.log('Beware of the ' + newSpecies + '!');
      spooked.push('Beware of the ' + newSpecies + '!');
    }
  }

  return spooked;
}

export { getSpooked, getSpookedFixed };