const questions = [
  {
    id: 1,
    description: "Who is the author of <cite>The Hitchhiker's Guide to the Galaxy</cite>?",
    options: ['Dan Simmons', 'Douglas Adams', 'Stephen Fry', 'Robert A. Heinlein'],
  },
  {
    id: 2,
    description: 'Which of the following numbers is the answer to Life, the \
                  Universe and Everything?',
    options: ['66', '13', '111', '42'],
  },
  {
    id: 3,
    description: 'What is Pan Galactic Gargle Blaster?',
    options: ['A drink', 'A machine', 'A creature', 'None of the above'],
  },
  {
    id: 4,
    description: 'Which star system does Ford Prefect belong to?',
    options: ['Aldebaran', 'Algol', 'Betelgeuse', 'Alpha Centauri'],
  },
];
const answerKey = { '1': 'Douglas Adams', '2': '42', '3': 'A drink', '4': 'Betelgeuse' };

let quizApp = {
  init: function(document, questions, answerKey) {
    this.document = document;
    this.questions = questions;
    this.answerKey = answerKey;
    this.score = 0;
    this.questionTemplate = Handlebars.compile(document.getElementById('question_template').innerHTML);
    this.renderQuestions();
  },
  renderQuestions: function() {
    this.questions.forEach(question => {
      this.document.querySelector('fieldset').insertAdjacentHTML('beforeend', this.questionTemplate(question));
    })
  }
}
document.addEventListener('DOMContentLoaded', function() {
  quizApp.init(document, questions, answerKey);
});