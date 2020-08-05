const fs = require('fs');
const path = require('path');
import { initializeDataStructure, getAllDirectAndIndirectChildren } from "../code/exercise_two";

describe('Exercise Two', function () {
  let dataStructure, expected, results;
  beforeEach(() => {
    let codeDirectory = path.join(__dirname, '..', 'code');
    document.body.innerHTML = fs.readFileSync(codeDirectory + '/exercise_two.html', 'utf8');
    dataStructure = initializeDataStructure(document)[0];
  });

  it('dataStructure is properly initialized', function () {
    expected = {
      "1":  { direct: 0, indirect: 0 }, "2":  { direct: 0, indirect: 0 },
      "3":  { direct: 0, indirect: 0 }, "4":  { direct: 0, indirect: 0 },
      "5":  { direct: 0, indirect: 0 }, "6":  { direct: 0, indirect: 0 },
      "7":  { direct: 0, indirect: 0 }, "8":  { direct: 0, indirect: 0 },
      "9":  { direct: 0, indirect: 0 }, "10": { direct: 0, indirect: 0 },
    };
    expect(dataStructure).toEqual(expected);
  });

  describe('Complete the Problem with a custom solution', function () {

  });
});