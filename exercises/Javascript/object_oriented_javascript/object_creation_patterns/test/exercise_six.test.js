import { itemCreator, ItemManager, ReportManager } from "../code/inventory";

describe('JS225 Object Oriented Javascript', function () {
  describe('Exercises Object Creation Patterns', function () {
    describe('Exercise Six', function () {
      let results, expected;
      describe('Item creation', function () {
        afterEach(() => {
          ItemManager.items = [];
        });
        it('should return true for valid item creation', function () {
          expect(ItemManager.create('basket ball', 'sports', 0)).toBe(true);
        });

        it('should return false for an invalid name', function () {
          expect(ItemManager.create('asd', 'sports', 0)).toBe(false);
        });

        it('should return false for invalid category', function () {
          expect(ItemManager.create('volley ball', 'foo', 1)).toBe(false);
          expect(ItemManager.create('volley ball', 'foo bar', 3)).toBe(false);
        });

        it('should return false for invalid quantity', function () {
          expect(ItemManager.create('soccer', 'sports')).toBe(false);
        });

        it('should add valid items to a collection', function () {
          ItemManager.create('basket ball', 'foo', 3);
          ItemManager.create('basket ball', 'sports', 3);
          ItemManager.create('soccer', 'sports', 5);
          ItemManager.create('kitchen pot', 'cooking', 2);
          ItemManager.create('hand drill', 'tools', 1);
          results = ItemManager.items;
          expected = [
            {  skuCode: "BASSP", name: 'basket ball', category: 'sports', quantity: 3 },
            {  skuCode: "SOCSP", name: 'soccer', category: 'sports', quantity: 5 },
            {  skuCode: "KITCO", name: 'kitchen pot', category: 'cooking', quantity: 2 },
            {  skuCode: "HANTO", name: 'hand drill', category: 'tools', quantity: 1 },
          ];
          expect(results).toEqual(expected);
        });
      });
      describe('Methods on ItemManager', function () {
        beforeEach(() => {
          ItemManager.create('basket ball', 'sports', 3);
          ItemManager.create('soccer', 'sports', 5);
          ItemManager.create('kitchen pot', 'cooking', 2);
          ItemManager.create('hand drill', 'tools', 1);
        });
        afterEach(() => {
          ItemManager.items = [];
        });

        it('should update an item', function () {
          let x = ItemManager.items;
          let before = ItemManager.items.filter((item) => item.category === 'cooking')[0];
          let after = ItemManager.update('KITCO', { quantity: 0 });
          results = [before, after];
          expected = [
            { skuCode: 'KITCO', name: 'kitchen pot', category: 'cooking', quantity: 2 },
            { skuCode: 'KITCO', name: 'kitchen pot', category: 'cooking', quantity: 0 },
          ];
        });

        it('should delete an item', function () {
          expected = [
            { skuCode: 'BASSP', name: 'basket ball', category: 'sports', quantity: 3 },
            { skuCode: 'KITCO', name: 'kitchen pot', category: 'cooking', quantity: 2 },
            { skuCode: 'HANTO', name: 'hand drill', category: 'tools', quantity: 1 },
          ];
          let removedItem = ItemManager.delete('SOCSP');
          expect(removedItem[0]).toEqual({ skuCode: 'SOCSP', name: 'soccer', category: 'sports', quantity: 5 });
          expect(ItemManager.items).toEqual(expected);
        });

        it('inStock returns all items where quantity is greater than 0', function () {
          ItemManager.update('SOCSP', { quantity: 0 })
          expected = [
            { skuCode: 'BASSP', name: 'basket ball', category: 'sports', quantity: 3 },
            { skuCode: 'KITCO', name: 'kitchen pot', category: 'cooking', quantity: 2 },
            { skuCode: 'HANTO', name: 'hand drill', category: 'tools', quantity: 1 },
          ];
          results = ItemManager.inStock();
          expect(results).toEqual(expected);
        });

        it('itemsInCategory should return all items within a given category', function () {
          expected = [
            { skuCode: 'BASSP', name: 'basket ball', category: 'sports', quantity: 3 },
            { skuCode: 'SOCSP', name: 'soccer', category: 'sports', quantity: 5 },
          ];
          let results = ItemManager.itemsInCategory('sports');
          expect(results).toEqual(expected);
        });
      });
      describe('Methods on ReportManager', function () {
        let kitchenReporter;
        beforeEach(() => {
          ItemManager.create('basketball', 'sports', 3);
          ItemManager.create('football', 'sports', 5);
          ItemManager.create('kitchen pot', 'cooking', 8);
          ItemManager.create('hand drill', 'tools', 6);
          ItemManager.create('legos', 'kidstoys', 10);
          ReportManager.init(ItemManager);
        });
        afterEach(() => {
          ItemManager.items = [];
        });

        it('ReportManager should list all items in stock', function () {
          expected = 'basketball, football, kitchen pot, hand drill, legos';
          expect(ReportManager.reportInStock()).toBe(expected);
        });

        it('ReportManager should create a report object', function () {
          kitchenReporter = ReportManager.createReporter('KITCO');
          expect(typeof kitchenReporter).toBe('object');
        });

        it('reporter should update as object updates', function () {
          expected = [
            'skuCode: KITCO\nname: kitchen pot\ncategory: cooking\nquantity: 8\n',
            'skuCode: KITCO\nname: kitchen pot\ncategory: cooking\nquantity: 6\n',
          ]
          results = [];
          kitchenReporter = ReportManager.createReporter('KITCO');
          results.push(kitchenReporter.itemInfo());
          ItemManager.update('KITCO', { quantity: 6 });
          results.push(kitchenReporter.itemInfo());
          expect(results).toEqual(expected);
        });
      });
    });
  });
});