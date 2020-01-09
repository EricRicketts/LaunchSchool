function retire(currentAge, retireAge) {
  var yearsToRetire = retireAge - currentAge;
  var currentDate = new Date();
  var currentYear = currentDate.getUTCFullYear();
  var retireYear = currentYear + yearsToRetire;
  var firstPhrase = 'It is ' + currentYear + '.  ' +
    'You will retire in ' + retireYear + '.\n';
  var secondPhrase = 'You only have ' + yearsToRetire +
    ' years of work to go!';

  return firstPhrase + secondPhrase;
}
export { retire }