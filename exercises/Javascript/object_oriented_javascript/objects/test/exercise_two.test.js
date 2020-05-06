describe('Exercises JS225 Object Oriented Javascript Objects Exercise Two', function () {
  let item, flawedDiscount, correctDiscount;
  beforeEach(() => {
    item = {
      name: 'Foo',
      description: 'Fusce consequat dui est, semper.',
      price: 50,
      quantity: 100,
    };
    flawedDiscount = function(percent) {
      let discount = this.price * percent/100;
      this.price -= discount;

      return this.price;
    }
    correctDiscount = function(percent) {
      let discount = this.price * percent/100;

      return  this.price - discount;
    }
  });

  it('should returns an incorrect discount price', function () {
    item.discount = flawedDiscount;
    expect(item.discount(20)).toBe(40);
    expect(item.discount(50)).not.toBe(25);
  });

  it('should return the correct discount price now that item price is not being changed', function () {
    item.discount = correctDiscount;
    let actual = [item.discount(20), item.discount(50), item.discount(25)];
    let expected = [40, 25, 37.5];
    expect(actual).toEqual(expected);
  });
});