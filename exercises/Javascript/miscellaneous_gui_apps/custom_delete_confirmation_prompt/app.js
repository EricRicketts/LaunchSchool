let todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John' }
];
let App = {
  addRemoveTodoHandlers: function() {
    let removeSpans = Array.from(this.document.getElementsByClassName('remove'));
    removeSpans.forEach(span => span.addEventListener('click', event => this.removeTodoHandler(event)));
  },
  hidePopup: function(event) {
    event.target.parentElement.parentElement.style.display = 'none';
  },
  populateTodos: function() {
    this.todoItems.forEach(({ id, title }) => {
      let html = this.template({ id, title });
      this.list.insertAdjacentHTML('beforeend', html);
    })
  },
  removeTodoHandler: function(event) {
    let popUp = this.document.getElementById('popup');
    popUp.style.display = 'block';
    Array.from(popUp.getElementsByTagName('button')).forEach(button => {
      let span = event.target;
      let id = span.parentElement.dataset.id;
      if (button.textContent.includes('Yes') && !!id) {
        button.addEventListener('click', event => this.yesButtonHandler(event, id, span.parentElement));
      } else if(button.textContent.includes('No')) {
        button.addEventListener('click', event => this.hidePopup(event));
      }
    });
  },
  yesButtonHandler: function(event, id, element) {
    let numericId = Number.parseInt(id, 10);
    let todoItemToDelete = this.todoItems.find(obj => obj.id === numericId);
    if (todoItemToDelete) {
      let indexToDelete = this.todoItems.findIndex(obj => obj.id === todoItemToDelete.id);
      this.todoItems.splice(indexToDelete, 1);
      this.list.removeChild(element);
      this.hidePopup(event);
    }
  },
  init: function(document) {
    let source = document.getElementById('todo_items').innerHTML;
    this.template = Handlebars.compile(source);
    this.document = document;
    this.list = this.document.getElementById('todos');
    this.todoItems = JSON.parse(JSON.stringify(todoItems));
    this.populateTodos();
    this.addRemoveTodoHandlers();
  }
};
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
