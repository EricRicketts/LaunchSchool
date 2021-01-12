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
    this.showMenu(listItem);
    this.document.addEventListener('click', this.clickOutsideMenuHandler.bind(this));
  },
  populateTodos: function() {
    this.todoItems.forEach(({ id, title }) => {
      let html = this.template({ id, title });
      this.list.insertAdjacentHTML('beforeend', html);
    })
  },
  showMenu: function(listItem) {
    let menu = listItem.querySelector('div.menu');
    const rect = listItem.getBoundingClientRect();
    const x = event.clientX - rect.left;
    const y = event.clientY - rect.top;
    menu.style.left = `${x}px`;
    menu.style.top = `${y}px`;
    menu.style.display = 'block';
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
    this.addListItemHandlers();
  }
};
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});

/*
  1.  Start with a right click on the li element, this needs to bring up the menu.
  2.  put a mouseover event on the delete selection
      a.  If there is a mouseover, then get the parent and change the color and text.
      b.  If there is a 'click' event the menu needs to disappear and the popup needs to be enabled
      b.  If there is a 'click' on the delete element then get the data-id of the parent div.
      c.  If there is a 'click' on the delete element then use the data-id to find the li element to delete it.
      d.  if there is a mouseleave event then change the color and text back to the default.
      e.  if there is a document click event then if the menu is not hidden it needs to be removed
*/
