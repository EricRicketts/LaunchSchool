let todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John' }
];
let App = {
  populateTodos: function() {
    this.todoItems.forEach(({ id, title }) => {
      let html = this.template({ id, title });
      this.list.insertAdjacentHTML('beforeend', html);
    })
  },
  init: function(document) {
    let source = document.getElementById('todo_items').innerHTML;
    this.template = Handlebars.compile(source);
    this.document = document;
    this.list = this.document.getElementById('todos');
    this.todoItems = JSON.parse(JSON.stringify(todoItems));
    this.populateTodos();
  }
};
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});