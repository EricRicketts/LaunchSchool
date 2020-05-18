import { makeList, makeListNoPrivacy } from "../code/objects_and_closures";

describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Objects and Closures', function () {
    let expected, actual, list;
    it('demonstrates all of the requirements for the to do list', function () {
      list = makeList();
      actual = [
        list.list(), list.add('peas'), list.add('corn'), list.list(),
        list.remove('peas'), list.list()
      ];
      expected = [
        'The list is empty.', 'peas added!',
        'corn added!', 'peas\ncorn', 'peas removed!', 'corn'
      ];
      expect(actual).toEqual(expected);
    });

    it('demonstrate above functionality with no private variables', function () {
      list = makeListNoPrivacy();
      actual = [
        list.list(), list.add('peas'), list.add('corn'), list.list(),
        list.items.toString(), list.remove('peas'), list.list(0)
      ];
      expected = [
        'The list is empty.', 'peas added!', 'corn added!', 'peas\ncorn',
         'peas,corn', 'peas removed!', 'corn'
      ];
      expect(actual).toEqual(expected);
    });
  }); 
});