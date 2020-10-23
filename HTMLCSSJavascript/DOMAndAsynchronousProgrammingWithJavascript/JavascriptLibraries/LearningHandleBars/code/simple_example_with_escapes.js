document.addEventListener('DOMContentLoaded', () => {
  let source = document.getElementById('entry-template').innerHTML;
  let template = Handlebars.compile(source);
  let context = { title: 'All about <p> tags', body: '<p>This is about &lt;p&gt; tags.</p>' };
  let div = document.createElement('div');
  div.innerHTML = template(context);
  let html = div.firstElementChild;
  document.body.insertBefore(html, document.getElementById('entry-template'));
});