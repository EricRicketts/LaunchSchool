document.addEventListener('DOMContentLoaded', function() {
  let context = {
    title: 'My First Blog Post!',
    author: {
      id: 47,
      name: 'Yehuda Katz'
    },
    body: 'My first post.  Wheeeee!!'
  }

  let source = document.getElementById('entry-point').innerHTML;
  let template = Handlebars.compile(source);
  let div = document.createElement('div');
  div.innerHTML = template(context);
  document.body.insertBefore(div.firstElementChild, document.getElementById('entry-point'));
});