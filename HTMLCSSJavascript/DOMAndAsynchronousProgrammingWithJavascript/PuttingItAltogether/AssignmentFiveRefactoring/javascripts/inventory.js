var inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      let dateText = document.createTextNode(new Date().toUTCString());
      document.querySelector('#order_date').appendChild(dateText);
    },
    cacheTemplate: function() {
      let inventoryItem = document.getElementById('inventory_item');
      this.template = Handlebars.compile(inventoryItem.innerHTML);
    },
    add: function() {
      this.lastId++;
      var item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      var found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    update: function(tableRow) {
      let id = this.findID(tableRow);
      let item = this.get(id);

      item.name = tableRow.querySelector('[name^=item_name]').value;
      item.stock_number = tableRow.querySelector('[name^=item_stock_number]').value;
      item.quantity = tableRow.querySelector('[name^=item_quantity]').value;
    },
    newItem: function(e) {
      e.preventDefault();
      let item = this.add();

      let inventoryItemParent = document.createElement('tbody');
      inventoryItemParent.innerHTML = this.template({ id: item.id });
      document.getElementById('inventory').appendChild(inventoryItemParent.firstElementChild);
    },
    findParent: function(e) {
      return e.target.closest('tr');
    },
    findID: function(item) {
      return Number.parseInt(item.querySelector("input[type=hidden]").value, 10);
    },
    deleteCallback: function(event, context) {
      let deleteAnchorClicked = event.target.nodeName === 'A' &&
        event.target.classList.contains('delete');
      if (deleteAnchorClicked) {
        context.deleteItem(event);
      }
    },
    deleteItem: function(e) {
      e.preventDefault();
      let item = this.findParent(e);
      item.remove();
      this.remove(this.findID(item));
    },
    updateCallback: function(event, context) {
      let allInventoryInputs = document.getElementById('inventory').getElementsByTagName('input');
      Array.from(allInventoryInputs).forEach(inputElement => {
        inputElement.onblur = context.updateItem(event);
      });
    },
    updateItem: function(e) {
      let tableRow = this.findParent(e);

      this.update(tableRow);
    },
    bindEvents: function() {
      let inventoryTable = document.querySelector('#inventory');
      document.querySelector('#add_item').addEventListener('click', event => this.newItem(event, this));
      inventoryTable.addEventListener('click', event => this.deleteCallback(event, this));
      inventoryTable.addEventListener('focusout', event => this.updateCallback(event, this));
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

document.addEventListener('DOMContentLoaded', () => inventory.init());