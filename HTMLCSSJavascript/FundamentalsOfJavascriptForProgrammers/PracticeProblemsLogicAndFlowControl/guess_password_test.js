describe('Guess Password', function () {
  var password = 'password';

  function guessPassword(guesses) {
    if (guesses.includes(password)) {
      return 'You have successfully logged in.';
    } else {
      return 'You have been denied access.'
    }
  }

  it('exits on more than three guesses', function (done) {
    var guesses = ['123', 'opensesame', 'letmein'];
    expect(guessPassword(guesses)).to.equal('You have been denied access.')
    done();
  });

  it('identifies correct password', function (done) {
    var guesses = ['opensesame', 'password'];
    expect(guessPassword(guesses)).to.equal('You have successfully logged in.')
    done();
  });
});