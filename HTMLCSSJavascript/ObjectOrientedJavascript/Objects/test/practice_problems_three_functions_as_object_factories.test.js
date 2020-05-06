describe('JS225 Object Oriented Javascript: Objects: Practice Problem Set Three Functions As Object Factories', function () {
  let chile, canada, southAfrica, actual, expected;
  function makeCountry(country, continent) {
    return {
      country: country,
      continent: continent,
      getDescription: function () {
        return this.country + ' is located in ' + this.continent + '.';
      }
    }
  }
  function makeCountryVersionTwo(country, continent, visited = false) {
    return {
      country: country,
      continent: continent,
      visited: visited,
      visitCountry: function() {
        return this.visited = true;
      },
      getDescription: function() {
        let basePhrase = this.country + ' is located in ' + this.continent + '.';
        let nonVisitedAddition = "I haven't visited " + this.country + '.';
        let visitedAddition = 'I have visited ' + this.country + '.';
        let visitedPhrase = basePhrase + '  ' + visitedAddition;
        let nonVisitedPhrase = basePhrase + '  ' + nonVisitedAddition;

        return this.visited ? visitedPhrase : nonVisitedPhrase;
      }
    }
  }
  beforeEach(() => {
    chile = makeCountry('The Republic of Chile', 'South America');
    canada = makeCountry('Canada', 'North America');
    southAfrica = makeCountry('The Republic of South Africa', 'Africa');
  });

  it('makes unique country objects', function () {
    actual = [chile.getDescription(), canada.getDescription(), southAfrica.getDescription()];
    expected = [
      'The Republic of Chile is located in South America.',
      'Canada is located in North America.',
      'The Republic of South Africa is located in Africa.'
    ];
    expect(actual).toEqual(expected);
  });

  it('modify getDescription method', function () {
    canada = makeCountryVersionTwo('Canada', 'North America');
    expect(canada.getDescription()).toBe('Canada is located in North America.  I haven\'t visited Canada.');
    canada.visitCountry();
    expect(canada.getDescription()).toBe('Canada is located in North America.  I have visited Canada.')
  });
});