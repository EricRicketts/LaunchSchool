document.addEventListener('DOMContentLoaded', function() {
  Handlebars.registerHelper('fullName', function(person) {
    return person.firstName + ' ' + person.lastName;
  });

  let context = {
    author: { firstName: 'Alan', lastName: 'Johnson' },
    body: 'I love Handlebars.',
    comments: [{
      author: { firstName: 'Yehuda', lastName: 'Katz' },
      body: 'Me too!'
    }]
  };

  let scriptElement = document.getElementById('entry-point');
  let source = scriptElement.innerHTML;
  let template = Handlebars.compile(source);
  let div = document.createElement('div');
  div.innerHTML = template(context);
  document.body.insertBefore(div.firstElementChild, scriptElement);
});