/*
  inventory is a variable declared at the top of the file and as such it is global to the
  entire file, we we see with the IIFE below that it is accessible and set as an object with
  properties lastId, collection, and setDate.
*/
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
      let iTmpl = document.querySelector('#inventory_item');
      this.template = iTmpl.parentElement.removeChild(iTmpl).innerHTML;
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
      let newTemplateStr = this.template.replace(/ID/g, item.id);

      let tbody = document.createElement('tbody');
      tbody.innerHTML = newTemplateStr;
      document.getElementById('inventory').appendChild(tbody.firstElementChild);
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

document.addEventListener('DOMContentLoaded', function() {
  inventory.init();
});
// $($.proxy(inventory.init, inventory));
/*
so lets work from the inside out, $.proxy(inventory.init, inventory) what does this expression do?
According to the jQuery documentation, jQuery.proxy(function, context) is the same as
$.proxy(function, context).  So this function returns a new function based on the given context.  In this
case the context is inventory which is an object instantiated at the beginning of the IIFE.  Then
$(new function) is called because $() is the same as document.addEventListener('DOMContentLoaded',
function() {});  So, init() is called which calls setDate(), cacheTemplate() and bindEvents().
*/
