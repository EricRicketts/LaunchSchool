describe('JS225 Object Oriented Javascript: Objects: Practice Problems Set Four: Object Orientation', function () {
  let expected;
  describe('Building a system with simple objects', function () {
    let scissors, drill, setProductPrice, describeProduct;
    beforeEach(() => {
      scissors = {
        id: 0,
        name: 'Scissors',
        stock: 8,
        price: 10
      }
      drill = {
        id: 1,
        name: 'Cordless Drill',
        stock: 15,
        price: 45
      }
      setProductPrice = function(product, price) {
        return price < 0 ? 'Price is less than zero, not updated.' : product.price = price;
      }
      describeProduct = function(product) {
        let idString = 'ID: ' + product.id + '\n';
        let nameString = 'Name: ' + product.name + '\n';
        let stockString = 'Stock: ' + product.stock + '\n';
        let priceString = 'Price: $' + product.price + '\n';

        return nameString + idString + priceString + stockString;
      }
    });

    it('should set price on an item', function () {
      let previousPrice = scissors.price;
      setProductPrice(scissors, 15);
      let newPrice = scissors.price;
      expect([previousPrice, newPrice]).toEqual([10, 15]);
    });

    it('should not allow a price to be set lower than zero', function () {
      let errorInPrice = setProductPrice(drill, -5);
      expected = ['Price is less than zero, not updated.', 45];
      expect([errorInPrice, drill.price]).toEqual(expected);
    });

    it('should describe a product', function () {
      expected = 'Name: Scissors\nID: 0\nPrice: $10\nStock: 8\n';
      expect(describeProduct(scissors)).toBe(expected);
    });
  });

  describe('Move functionality into the objects', function () {
    let scissors, drill;
    beforeEach(() => {
      scissors = {
        id: 0,
        name: 'Scissors',
        stock: 8,
        price: 10,
        describeProduct: function () {
          let idString = 'ID: ' + this.id + '\n';
          let nameString = 'Name: ' + this.name + '\n';
          let stockString = 'Stock: ' + this.stock + '\n';
          let priceString = 'Price: $' + this.price + '\n';

          return nameString + idString + priceString + stockString;
        },
        setProductPrice: function(price) {
          return price < 0 ? 'Price is less than zero, not updated.' : this.price = price;
        }
      }
      drill = {
        id: 1,
        name: 'Cordless Drill',
        stock: 15,
        price: 45,
        describeProduct: function () {
          let idString = 'ID: ' + this.id + '\n';
          let nameString = 'Name: ' + this.name + '\n';
          let stockString = 'Stock: ' + this.stock + '\n';
          let priceString = 'Price: $' + this.price + '\n';

          return nameString + idString + priceString + stockString;
        },
        setProductPrice: function(price) {
          return price < 0 ? 'Price is less than zero, not updated.' : this.price = price;
        }
      }
    });

    it('should describe the product', function () {
      expected = 'Name: Cordless Drill\nID: 1\nPrice: $45\nStock: 15\n';
      expect(drill.describeProduct()).toBe(expected);
    });

    it('should set a valid price', function () {
      let priorPrice = scissors.price;
      scissors.setProductPrice(15);
      let currentPrice = scissors.price;
      expect([priorPrice, currentPrice]).toEqual([10, 15]);
    });

    it('should warn of an invalid price', function () {
      expect(scissors.setProductPrice(-5)).toBe('Price is less than zero, not updated.');
    });
  });

  describe('Object Factory Approach', function () {
    let createProduct, scissors, drill;
    beforeEach(() => {
      createProduct = function(id, name, stock, price) {
        return {
          name: name,
          id: id,
          stock: stock,
          price: price,
          describe: function() {
            let idString = 'ID: ' + this.id + '\n';
            let nameString = 'Name: ' + this.name + '\n';
            let stockString = 'Stock: ' + this.stock + '\n';
            let priceString = 'Price: $' + this.price + '\n';

            return nameString + idString + priceString + stockString;

          },
          setPrice: function(price) {
            return price < 0 ? 'Price is less than zero, not updated.' : this.price = price;
          }
        }
      }
      scissors = createProduct(0, 'Scissors', 8, 10);
      drill = createProduct(1, 'Cordless Drill', 15, 45);
    });

    it('should describe the product', function () {
      expected = 'Name: Scissors\nID: 0\nPrice: $10\nStock: 8\n';
      expect(scissors.describe()).toBe(expected);
    });

    it('should set the price', function () {
      let priorPrice = drill.price;
      drill.setPrice(50);
      let currentPrice = drill.price;
      expect([priorPrice, currentPrice]).toEqual([45, 50]);
    });
  });
});