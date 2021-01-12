let todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John' }
];
let App = {
  addListItemHandlers: function() {
    let allListItems = Array.from(this.list.getElementsByTagName('li')).forEach(listItem => {
      listItem.addEventListener('contextmenu', event => this.listItemHandler(event, listItem));
    });
  },
  clickOutsideMenuHandler: function(event) {
    let allMenus = Array.from(this.document.querySelectorAll('div.menu'));
    let activeMenu = allMenus.find(menu => menu.style.display === 'block');
    if (activeMenu) {
      let isClickedOutside = !activeMenu.contains(event.target);
      if (isClickedOutside) {
        activeMenu.style.display = 'none';
      }
    }
  },
  hidePopup: function(event) {
    event.target.parentElement.parentElement.style.display = 'none';
  },
  listItemHandler: function(event, listItem) {
    event.preventDefault();
    this.showMenu(event, listItem);
    let menu = listItem.querySelector('div.menu');
    let menuParagraphs = Array.from(menu.querySelectorAll('p'));
    menuParagraphs.forEach(p => p.addEventListener('mouseenter', event => this.menuEnterHandler(event)));
    menuParagraphs.forEach(p => p.addEventListener('mouseleave', event => this.menuExitHandler(event)));
    menuParagraphs.forEach(p => p.addEventListener('click', event => this.menuClickHandler(event)));
    this.document.addEventListener('click', this.clickOutsideMenuHandler.bind(this));
  },
  menuClickHandler: function(event) {
    event.target.parentElement.style.display = 'none';
    if (event.target.classList.contains('delete_todo')) {
      let id = event.target.dataset.id;
      this.popUp.dataset.id = id;
      this.popUp.style.display = 'block';
      this.yesButton.addEventListener('click', event => this.yesButtonHandler(event));
      this.noButton.addEventListener('click', event => this.hidePopup(event));
    }
  },
  menuEnterHandler: function(event) {
    event.target.style.backgroundColor = 'darkgray';
    event.target.style.color = 'white';
  },
  menuExitHandler: function(event) {
    event.target.style.backgroundColor = 'lightgray';
    event.target.style.color = 'black';
  },
  noButtonEventHandler: function(event) {
    this.hidePopup(event);
    event.target.removeEventListener('click', this.noButtonEventHandler);
  },
  populateTodos: function() {
    this.todoItems.forEach(({ id, title }) => {
      let html = this.template({ id, title });
      this.list.insertAdjacentHTML('beforeend', html);
    })
  },
  removeTodoItem: function(event, id) {
    let listItemToRemove = Array.from(this.list.querySelectorAll('li')).find(li => li.dataset.id === id.toString());
    if (listItemToRemove) {
      this.list.removeChild(listItemToRemove);
      this.hidePopup(event);
    }
  },
  removeTodoItemData(id) {
    let todoItemToRemove = this.todoItems.find(todo => todo.id === id);
    if (todoItemToRemove) {
      let indexToRemove = this.todoItems.findIndex(todo => todo.id === todoItemToRemove.id);
      this.todoItems.splice(indexToRemove, 1);
    }
  },
  showMenu: function(event, listItem) {
    let menu = listItem.querySelector('div.menu');
    const rect = listItem.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    menu.style.left = `${x}px`;
    menu.style.top = `${y}px`;
    menu.style.display = 'block';
  },
  yesButtonHandler: function(event) {
    let numericId = Number.parseInt(event.target.parentElement.parentElement.dataset.id, 10);
    this.removeTodoItemData(numericId);
    this.removeTodoItem(event, numericId);
  },
  init: function(document) {
    let source = document.getElementById('todo_items').innerHTML;
    this.template = Handlebars.compile(source);
    this.document = document;
    this.list = this.document.getElementById('todos');
    this.popUp = this.document.getElementById('popup');
    this.yesButton = this.popUp.querySelectorAll('button').item(0);
    this.noButton = this.popUp.querySelectorAll('button').item(1);
    this.todoItems = JSON.parse(JSON.stringify(todoItems));
    this.populateTodos();
    this.addListItemHandlers();
  }
};
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
