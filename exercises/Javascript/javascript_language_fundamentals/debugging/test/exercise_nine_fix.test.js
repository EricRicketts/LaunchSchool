import { updateCart, checkout } from "../code/expensive_study_preparation_fix";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Nine', function () {
  beforeEach(() => {
    updateCart('notebook');
    updateCart('pencil', 2);
    updateCart('coffee', 1);
    updateCart('pencil', 0);
  });
  it('charges too much for the items', function () {
    // should be $12.99 as there are no pencils, a pencil was added in
    expect(checkout()).toBe('You have been charged $12.99.');
  });
});