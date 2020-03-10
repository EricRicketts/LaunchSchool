import { random } from "../code/random_recipe_generator";

describe('JS210 Small Problems Debugging Exercise Three', function () {
  let ingredients, spices, extras, adjective, firstNoun, secondNoun, dishName;
  beforeEach(() => {
    ingredients = ['rice', 'green bell pepper', 'mushrooms', 'carrot', 'kebab',
      'spinach', 'soy bean sprouts', 'mashed potatoes', 'corn', 'cucumber', 'peas'];

    spices = ['peri peri', 'cinnamon', 'nutmeg', 'cardamom', 'ground ginger',
      'poppy seed', 'cumin'];

    extras = ['peanuts', 'sesame seeds', 'egg', 'wasabi', 'soy sauce'];

    adjective  = ['Delicious', 'Hot', 'Exotic', 'Creative', 'Festive', 'Dark'];
    firstNoun  = ['Power', 'After Work', 'Holiday', 'Disco', 'Late Night'];
    secondNoun = ['Mix', 'Delight', 'Bowl', 'Chunk', 'Surprise', 'Bliss'];
  });

  it('should throw a type error', function () {
    dishName = random(adjective) + random(firstNoun) + random(secondNoun);
    expect(() => { dishName.join(', ') }).toThrow(TypeError);
  });

  it('should produce a dish name by concatenating the array outputs', function () {
    dishName = random(adjective).concat(random(firstNoun), random(secondNoun));
    let name = dishName.join(', ');
    expect(name).toMatch(/[\w\s]+,\s+[\w\s]+,\s+[\w\s]+/);
  });
});
/*
The problem in line 20 of this file is that the "+" operator is being used to concatenate
arrays but what the operator does when the arguments are arrays is to convert the arrays
to strings and then concatenate the resulting strings.  This after the string is composed
an attempt is made to call 'join' on the string, which has no such method available to it.

The fix is in the second test, the function returns an array so I use the concat method
to join the arrays into one array.  I can then call "join" on the resulting array.
 */
