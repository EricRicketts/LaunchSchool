let turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon'
}

let firstObj = {
  description: turk,
  getDescription: function() {
    return this.description.firstName + ' ' + this.description.lastName +
      ' is a ' + this.description.occupation + '.';
  }
}

let secondObj = {
  description: turk,
  getDescription: function() {
    return function() {
      return this.description.firstName + ' ' + this.description.lastName +
        ' is a ' + this.description.occupation + '.';
    }.bind(this);
  }
}

let TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    let ary = [];
    this.titles.forEach(function(title) {
      ary.push(this.seriesTitle + ' ' + title);
    });
    return ary;
  }
}

let fixTESGames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    let ary = [];
    this.titles.forEach(function(title) {
      ary.push(this.seriesTitle + ' ' + title);
    }, this);
    return ary;
  }
}

let secondFixTESGames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    let that = this;
    let ary = [];
    this.titles.forEach(function(title) {
      ary.push(that.seriesTitle + ' ' + title);
    });
    return ary;
  }
}

let foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      globalThis.a += 1;
    }
    return increment();
  }
}

let secondFoo = {
  a: 0,
  incrementA: function() {
    let increment = function () {
      this.a += 1;
    }.bind(this);
    return increment();
  }
}

let thirdFoo = {
  a: 0,
  incrementA: function() {
    function increment () {
      this.a += 1;
    };
    increment.apply(this);
    increment.apply(this);
    increment.apply(this);
  }
}

function logReturnValue(func) {
  return func();
}

function logReturnValueSecond(func, context) {
  return func.call(context);
}

export { firstObj, secondObj, TESgames, fixTESGames, foo, secondFoo, thirdFoo,
  secondFixTESGames, logReturnValue, logReturnValueSecond };