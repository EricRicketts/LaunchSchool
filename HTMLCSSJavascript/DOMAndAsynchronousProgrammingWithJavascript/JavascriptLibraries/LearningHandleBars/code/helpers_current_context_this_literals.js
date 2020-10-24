document.addEventListener('DOMContentLoaded', function() {
  let context = {
    items: [
      { name: 'Handlebars', emotion: 'love' },
      { name: 'Mustache', emotion: 'enjoy' },
      { name: 'Ember', emotion: 'want to learn' }
    ]
  }

  Handlebars.registerHelper('agree_button', function() {
    let emotion = Handlebars.escapeExpression(this.emotion);
    let name = Handlebars.escapeExpression(this.name);

    return new Handlebars.SafeString(`<button>I agree.  I ${emotion} ${name}</button>`);
  });

  let handleBarsScript = document.getElementById('entry-template');
  let div = document.createElement('div');
  let source = handleBarsScript.innerHTML;
  let template = Handlebars.compile(source);
  div.innerHTML = template(context);
  document.body.insertBefore(div.firstElementChild, handleBarsScript);
});