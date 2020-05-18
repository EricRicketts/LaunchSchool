function makeList() {
  let toDos = [];
  return {
    add: function(toDoItem) {
      toDos.push(toDoItem);
      return toDoItem + ' added!';
    },
    remove: function(toDoItem) {
      let toDoItemIndex = toDos.indexOf(toDoItem);
      if (toDoItemIndex === -1) {
        return toDoItem + ' not present.';
      } else {
        toDos.splice(toDoItemIndex, 1);
        return toDoItem + ' removed!';
      }
    },
    list: function() {
      return toDos.length === 0 ? 'The list is empty.' : toDos.join('\n');
    }
  }
}

function makeListNoPrivacy() {
  return {
    items: [],
    add: function(toDoItem) {
      this.items.push(toDoItem);
      return toDoItem + ' added!';
    },
    remove: function(toDoItem) {
      let toDoItemIndex = this.items.indexOf(toDoItem);
      if (toDoItemIndex === -1) {
        return toDoItem + ' not present.';
      } else {
        this.items.splice(toDoItemIndex, 1);
        return toDoItem + ' removed!';
      }
    },
    list: function() {
      return this.items.length === 0 ? 'The list is empty.' : this.items.join('\n');
    }
  }
}

export { makeList, makeListNoPrivacy };