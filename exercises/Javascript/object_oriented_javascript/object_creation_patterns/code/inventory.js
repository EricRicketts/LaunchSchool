'use strict';

let itemCreator = (function() {
  const spaceRegex = /\s+/g;

  return {
    isValidItemName(itemName) {
      return itemName.slice().replace(spaceRegex, '').length >= 5;
    },
    isCategoryNameValid(categoryName) {
      return !spaceRegex.test(categoryName) && categoryName.length >= 5;
    },
    isQuantityDefined(quantity) {
      return typeof quantity === 'number' && quantity >= 0;
    },
    makeSKUCode(itemName, categoryName) {
      let firstThreeLetters = itemName.slice().replace(spaceRegex, '').substring(0, 3).toUpperCase();
      let lastTwoLetters = categoryName.substring(0, 2).toUpperCase();
      return firstThreeLetters + lastTwoLetters;
    }
  }
})();

let ItemManager = (function() {
  return {
    items: [],

    create(name, category, quantity) {
      let validEntries = itemCreator.isValidItemName(name) && itemCreator.isCategoryNameValid(category) &&
        itemCreator.isQuantityDefined(quantity);
      let obj = {};
      let skuCode = itemCreator.makeSKUCode(name, category);
      if (validEntries) {
        obj = { skuCode, name, category, quantity };
        this.items.push(obj);
        return true;
      } else {
        return false;
      }
    },

    delete(desiredSkuCode) {
      let skuCodeIndex = this.items.findIndex((item) => item.skuCode === desiredSkuCode);
      return this.items.splice(skuCodeIndex, 1);
    },

    inStock() {
      return this.items.filter((item) => item.quantity > 0);
    },

    itemsInCategory(category) {
      return this.items.filter((item) => item.category === category);
    },

    update(desiredSkuCode, propertyUpdates) {
      let item = this.items.find((item) => item.skuCode === desiredSkuCode);
      Object.keys(propertyUpdates).forEach((propertyName) => {
        item[propertyName] = propertyUpdates[propertyName];
      });

      return item;
    },
  }
})();

let ReportManager = (function() {
  return {
    init(itemManager) {
      this.items = itemManager;
    },
    reportInStock() {
      return this.items.inStock().map((item) => item.name).join(', ');
    },
    createReporter(desiredSkuCode) {
      let item = this.items.items.find((item) => item.skuCode === desiredSkuCode);
      return {
        item,
        itemInfo() {
          let info = '';
          for (let [key, value] of Object.entries(this.item)) {
             info += `${key}: ${value}\n`;
          };

          return info;
        }
      }
    }
  }
})();

export { itemCreator, ItemManager, ReportManager };