describe('Practice problems operators and conditionals', function() {
  var apples, bananas, areEqual, eitherOr, lastName, familyMessage, result;

  beforeEach(function () {
    apples = 3;
    bananas = 5;
  });

  it('simple if statement', function () {
    if (apples === bananas) {
      result = 'it is true';
    } else {
      result = 'it is false';
    }

    expect(result).to.equal('it is false');
  });

  it('another simple if statement', function () {
    bananas = '3';

    if (apples.toString() === bananas) {
      result = 'it is true';
    } else{
      result = 'it is false'
    }

    expect(result).to.equal('it is true');
  });

  it('check for type and value', function () {
    bananas = '3';

    if (apples === bananas) {
      result = 'strictly equal';
    } else if (apples == bananas) {
      result = 'non strictly equal'
    }
    else{
      result = 'not equal in any sense'
    }

    expect(result).to.equal('non strictly equal');
  });

  it('more complicated conditional', function () {
    bananas = '3';

    if (apples === bananas) {
      'strictly equal'
    } else{
      if (apples == bananas) {
        result = 'non strictly equal'
      } else{
        result = 'not equal in any sense'
      }
    }

    expect(result).to.equal('non strictly equal');
  });

  it('capture boolean value from strict comparison', function () {
    bananas = 3;

    areEqual = (apples === bananas);
    expect(areEqual).to.be.true;
  });

  it('captures value from or comparison', function () {
    bananas = undefined;
    eitherOr = (apples || bananas);
    expect(eitherOr).to.equal(3);
  });

  it('capture short circuit value', function () {
    bananas = 1;
    eitherOr = (bananas || apples);
    expect(eitherOr).to.equal(1);
  });

  it('ternary operator', function () {
    lastName = 'Fudd';
    familyMessage = (lastName === 'Ricketts' ? 'You are family' : 'You are not family');
    expect(familyMessage).to.equal('You are not family');
  });
});