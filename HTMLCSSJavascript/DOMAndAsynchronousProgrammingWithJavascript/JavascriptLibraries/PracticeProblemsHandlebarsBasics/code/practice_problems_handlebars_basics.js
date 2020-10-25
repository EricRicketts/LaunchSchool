document.addEventListener('DOMContentLoaded', function() {
  let posts = [
    {
      title: 'Lorem ipsum dolor sit amet',
      published: 'April 1, 2015',
      body: '<p>' + 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.' + '</p>',
      tags: ['Food', 'Cooking', 'Vegetables']
    },
    {
      title: 'second title',
      published: 'April 1, 2016',
      body: '<p>' + 'foobar fizzbuzz' + '</p>',
      tags: []
    }
  ];

  let firstScriptTag = document.getElementById('first');
  let sourceScript = document.getElementById('post');
  let template = Handlebars.compile(sourceScript.innerHTML);
  let tagPartial = Handlebars.registerPartial('tag', document.getElementById('tag-partial').innerHTML);

  let domParser = new DOMParser();

  posts.forEach(post => {
    let templateDocument = domParser.parseFromString(template(post), 'text/html');
    Array.from(templateDocument.body.children).forEach(article => document.body.insertBefore(article, firstScriptTag));
  });
});

