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
    update: function($item) {
      var id = this.findID($item),
          item = this.get(id);

      item.name = $item.find("[name^=item_name]").val();
      item.stock_number = $item.find("[name^=item_stock_number]").val();
      item.quantity = $item.find("[name^=item_quantity]").val();
    },
    newItem: function(e) {
      e.preventDefault();
      var item = this.add(),
          $item = $(this.template.replace(/ID/g, item.id));

      $("#inventory").append($item);
    },
    findParent: function(e) {
      return $(e.target).closest("tr");
    },
    findID: function($item) {
      return +$item.find("input[type=hidden]").val();
    },
    deleteItem: function(e) {
      e.preventDefault();
      var $item = this.findParent(e).remove();

      this.remove(this.findID($item));
    },
    updateItem: function(e) {
      var $item = this.findParent(e);

      this.update($item);
    },
    bindEvents: function() {
      document.querySelector('#add_item').addEventListener('click', event => this.newItem(event));
      $("#inventory").on("click", "a.delete", $.proxy(this.deleteItem, this));
      $("#inventory").on("blur", ":input", $.proxy(this.updateItem, this));
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

$($.proxy(inventory.init, inventory));
/*
so lets work from the inside out, $.proxy(inventory.init, inventory) what does this expression do?
According to the jQuery documentation, jQuery.proxy(function, context) is the same as
$.proxy(function, context).  So this function returns a new function based on the given context.  In this
case the context is inventory which is an object instantiated at the beginning of the IIFE.  Then
$(new function) is called because $() is the same as document.addEventListener('DOMContentLoaded',
function() {});  So, init() is called which calls setDate(), cacheTemplate() and bindEvents().
*/
