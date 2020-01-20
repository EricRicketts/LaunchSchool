function wantToVisit(museum, city) {
  return museum.includes('Computer')
    || museum.includes('Science')
    && !(museum.includes('Modern')
      && museum.includes('Art')
      && museum.includes('Andy Warhol')
      || city === 'Amsterdam');
}

function wantToVisitFixed(museum, city) {
  return museum.includes('Computer')
    || museum.includes('Science')
    || ((museum.includes('Modern')
      && museum.includes('Art'))
      && (museum.includes('Andy Warhol')
      || city === 'Amsterdam'));
}

function wantToVisitRefactor(museum, city) {
  function contains(string, substring) {
    return string.toLowerCase().match(substring.toLowerCase()) != null;
  }

  let aboutComputers = contains(museum, 'Computer');
  let aboutScience = contains(museum, 'Science');
  let aboutModernArt = contains(museum, 'Modern') && contains(museum, 'Art');
  let aboutAndyWarhol = contains(museum, 'Andy Warhol');
  let inAmsterdam = city === 'Amsterdam';

  let mustGo = aboutComputers || aboutScience;
  let worthAnException = aboutModernArt && (aboutAndyWarhol || inAmsterdam);

  return mustGo || worthAnException;
}
/*
this last function is a refactoring from Launch School I included it because
with my VSLI background I can take for granted understanding complex boolean
expressions.  This refactoring is excellent as the variable names are very
intention revealing.
 */

export { wantToVisit, wantToVisitFixed, wantToVisitRefactor };