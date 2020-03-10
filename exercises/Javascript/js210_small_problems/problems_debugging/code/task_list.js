var todos = ['wash car', 'exercise', 'buy groceries', 'balance budget',
  'call plumber', 'feed fido', 'get gas',  'organize closet'];

function addTask(task) {
  if (todos.includes(task)) {
    console.log('That task is already on the list.');
  } else {
    todos.push(task);
  }
}

function completeTasks(n = 1) {
  var tasksComplete = 0;

  while (todos.length > 0 && tasksComplete < n) {
    console.log(todos[0] + ' complete!');
    delete todos[0];
    tasksComplete++;
  }

  if (todos.length === 0) {
    console.log('All tasks complete!');
  } else {
    console.log(tasksComplete + ' tasks completed; ' + todos.length + ' remaining.');
  }
}

function displayTaskList() {
  var i;

  console.log('ToDo list (' + todos.length + ' tasks):')
  console.log('---------------------');

  for (i = 0; i < todos.length; i++) {
    console.log('-- ' + todos[i]);
  }
}

/*
this was too hard to write a test for, I could have done it but it would have entailed replacing all of the
console.log statements with something that could be observed.

But I ran the code from the command line in Node.js and I think I discovered the problem.  The issue lies on
line 17 of hte code => delete todos[0].  If one wants to remove an element from an array one needs to use the
splice method.  This removes both the array index and the element associated with that index.  When using
the delete function, the index was removed bu the value remained in place.  This does not change the length
of the array so when displayTasklist is called the loop still iterates over the deleted items and returns
undefined on the console.  With the splice method, the value is removed and the length of the array is shortened
by the number of items removed.  The indices remain continuous.

In this case the Launch School solution also noted that the Array method shift would also work.
 */