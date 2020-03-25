// Standard role-playing dice, ranging from 4 faces to 20,
// specified in terms of minimum and maximum face value.
var d4  = {min: 1, max: 4};
var d6  = {min: 1, max: 6};
var d8  = {min: 1, max: 8};
var d10 = {min: 0, max: 9};
var d12 = {min: 1, max: 12};
var d20 = {min: 1, max: 20};

function roll(die) {
  return Math.floor(Math.random() * (die.max - die.min + 1)) + die.min;
}

// Toss one or more dice and sum up their face values.
function toss() {
  var dice = Array.prototype.slice.call(arguments);

  return dice.map(roll).reduce(function (sum, value) {
    return sum + value;
  });
}

// Standard target roll tossing a 20-sided die,
// with optional bonus and penalty dice.
// Used to determine whether a character wanting to perform an action
// succeeds or fails, based on whether the sum of the dice is higher
// or lower than the relevant character trait.
// (See below for examples.)
function targetRoll(characterValue, bonus, penalty, min = false, max = false) {
  var output = [];
  bonus = bonus || {min: 0, max: 0};
  penalty = penalty || {min: 0, max: 0};

  var result = toss(d20, bonus, penalty);
  // Normalize in case bonus or penalty push result out of the D20 range.
  if (min === true && max === false) {
    result = 1;
  } else if (min === false && max === true) {
    result = 20;
  } else {
    result = Math.max(1, result);
    result = Math.min(20, result);
  }

  output.push('--> ' + result);

  switch (result) {
    case 1:  output.push(automaticFail());
    case 20: output.push(automaticSuccess());
    default:
      let defaultResult = result >= characterValue ? success() : fail();
      output.push(defaultResult);
  }

  return output;
}

function targetRollFixed(characterValue, bonus, penalty, min = false, max = false) {
  var output = [];
  bonus = bonus || {min: 0, max: 0};
  penalty = penalty || {min: 0, max: 0};

  var result = toss(d20, bonus, penalty);
  // Normalize in case bonus or penalty push result out of the D20 range.
  if (min === true && max === false) {
    result = 1;
  } else if (min === false && max === true) {
    result = 20;
  } else {
    result = Math.max(1, result);
    result = Math.min(20, result);
  }

  output.push('--> ' + result);

  switch (result) {
    case 1: {
      output.push(automaticFail());
      break;
    }
    case 20: {
      output.push(automaticSuccess());
      break;
    }
    default: {
      let defaultResult = result >= characterValue ? success() : fail();
      output.push(defaultResult);
    }
  }

  return output;
}

function success() {
  return 'Your character succeeds.';
}

function fail() {
  return 'Your character fails.';
}

function automaticSuccess() {
  return 'Your character succeeds without effort. Glory!';
}

function automaticFail() {
  return 'Meagre attempt. Your character fails miserably.';
}

export { targetRoll, targetRollFixed };
/*
As we can see the problem with the original code was that there was no break statement
in the original switch statement, this mean if result was either 1 or 2 the code 'fell through'
to the next switch statement rather than breaking out of the switch statement.

I put in the min and max function parameters to force the function to take a certain path
through the switch statement, in reality all I would have done to fix the program was to add
the break statements in the switch statement
 */
