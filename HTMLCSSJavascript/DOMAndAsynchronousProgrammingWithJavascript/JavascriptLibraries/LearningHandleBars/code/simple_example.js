document.addEventListener('DOMContentLoaded', () => {
  let source = document.getElementById('entry-template').innerHTML;
  let template = Handlebars.compile(source);
  let context = { title: 'My New Post', body: 'This is my first post!' };
  let div = document.createElement('div');
  div.innerHTML = template(context);
  let html = div.firstElementChild;
  document.body.insertBefore(html, document.getElementById('entry-template'));
});