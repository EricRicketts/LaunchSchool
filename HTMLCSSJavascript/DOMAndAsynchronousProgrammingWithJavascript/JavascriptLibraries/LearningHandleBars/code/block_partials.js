document.addEventListener('DOMContentLoaded', function() {
  let context = {
    people: [
      { firstName: "Alan", lastName: "Johnson", phone: "1234567890", email: "alan@test.com", memberSince: "Mar 25, 2011" },
      { firstName: "Allison", lastName: "House", phone: "0987654321", email: "allison@test.com", memberSince: "Jan 13, 2011" },
      { firstName: "Nick", lastName: "Pettit", phone: "9836592272", email: "nick@test.com", memberSince: "Apr 9, 2009" },
      { firstName: "Jim", lastName: "Hoskins", phone: "7284927150", email: "jim@test.com", memberSince: "May 21, 2010" },
      { firstName: "Ryan", lastName: "Carson", phone: "8263729224", email: "ryan@test.com", memberSince: "Nov 1, 2008" }
    ]
  };

  let firstScriptTag = document.getElementById('import');
  let personPartial = document.getElementById('person-partial').innerHTML;
  Handlebars.registerPartial('person', personPartial);

  let peopleSource = document.getElementById('people-template').innerHTML;
  let peopleTemplate = Handlebars.compile(peopleSource);
  let domParser = new DOMParser();
  let peopleTemplateDocument = domParser.parseFromString(peopleTemplate(context), 'text/html');
  let peopleTemplateArray = peopleTemplateDocument.body.children;

  Array.from(peopleTemplateArray).forEach(div => document.body.insertBefore(div, firstScriptTag));
});