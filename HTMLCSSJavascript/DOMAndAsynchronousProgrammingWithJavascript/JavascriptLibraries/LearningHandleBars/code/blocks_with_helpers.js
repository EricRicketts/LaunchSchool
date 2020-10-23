document.addEventListener('DOMContentLoaded', function() {
  Handlebars.registerHelper('list', function(data, options) {
    let out = '<ul>';

    for (let index = 0; index < data.length; index += 1) {
      out += '<li>' + options.fn(data[index]) + '</li>';
    }

    return new Handlebars.SafeString(out + '</ul>');
  });

  let context = {
    people: [
      { firstName: 'Yehuda', lastName: 'Katz' },
      { firstName: 'Carl', lastName: 'Lerche' },
      { firstName: 'Alan', lastName: 'Johnson' }
    ]
  }


  let scriptElement = document.getElementById('entry-point');
  let source = scriptElement.innerHTML;
  let template = Handlebars.compile(source);
  let div = document.createElement('div');
  div.innerHTML = template(context)
  let html = div.firstElementChild;
  document.body.insertBefore(html, scriptElement);
});