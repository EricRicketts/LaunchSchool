QUnit.test('Hard binding permanently binds a function to an object', function (assert) {
  window.a = 'goodbye';
  let object = {
    a: 'hello',
    b: 'world',
    foo: function() {
      return this.a + ' ' + this.b;
    }
  }

  let bar = object.foo;
  assert.strictEqual(bar(), 'goodbye undefined', 'function call in global context');

  let baz = object.foo.bind(object);
  assert.ok(baz() === 'hello world', 'baz is now bound to object');

  let object2 = {
    a: 'hi',
    b: 'there'
  }

  assert.ok(baz.call(object2) === 'hello world', 'baz is permanently bound to object');
});
QUnit.test('Use contextual binding to create a Spanish Greeter object', function (assert) {
  let greetings = {
    morning: 'Good morning, ',
    afternoon: 'Good afternoon, ',
    evening: 'Good evening, ',

    greeting: function(name) {
      let currentHour = (new Date()).getHours();

      if (currentHour < 12) {
        return this.morning + name;
      } else if (currentHour < 18) {
        return this.afternoon + name;
      } else {
        return this.evening + name;
      }
    },
  };

  let spanishWords = {
    morning: 'Buenos dias, ',
    afternoon: 'Buenas tardes, ',
    evening: 'Buena noches, ',
  };

  let spanishGreeter = greetings.greeting.bind(spanishWords);

  let greetingPrefix = spanishGreeter('Jose').split('Jose')[0];
  let prefixes = [spanishWords.morning, spanishWords.afternoon, spanishWords.evening];
  assert.ok(prefixes.includes(greetingPrefix), 'spanish only greetings');
});