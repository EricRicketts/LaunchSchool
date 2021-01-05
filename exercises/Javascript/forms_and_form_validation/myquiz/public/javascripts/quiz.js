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
    this.questionTemplate = Handlebars.compile(document.getElementById('question_template').innerHTML);
    this.renderQuestions();
    this.bindFormHandlers();
  },
  bindFormHandlers: function() {
    let submitButton = this.document.querySelector('form > button:first-of-type');
    let resetButton = this.document.querySelector('form > button:nth-of-type(2)');
    submitButton.addEventListener('click', event => this.handleSubmit(event, resetButton));
  },
  gradeQuestion: function(question, answer) {
    let questionID = question.dataset.id;
    let answerValue = answer ? answer.value : answer;
    let correctAnswer = this.answerKey[questionID];

    if (answerValue === undefined) {
      this.markNoAnswer(question, correctAnswer);
    } else if (answerValue === correctAnswer) {
      this.markCorrectAnswer(question);
    } else {
      this.markIncorrectAnswer(question, correctAnswer);
    }
  },
  gradeQuiz: function(submitButton, resetButton) {
    submitButton.classList.add('disabled');
    let allQuestions = Array.from(this.document.getElementsByClassName('question'));
    allQuestions.forEach(question => {
      let answer = Array.from(question.querySelectorAll('input')).find(input => input.checked);
      this.gradeQuestion(question, answer);
    });
    resetButton.classList.remove('disabled');
  },
  handleSubmit: function(event, resetButton) {
    event.preventDefault();
    let submitButton = event.target;
    submitButton.classList.contains('disabled') ? undefined : this.gradeQuiz(submitButton, resetButton);
  },
  markCorrectAnswer: function(question) {
    let result = question.querySelector('p.result');
    let text = this.document.createTextNode('Correct Answer.');
    result.appendChild(text);
    result.classList.add('correct');
  },
  markIncorrectAnswer: function(question, correctAnswer) {
    let result = question.querySelector('p.result');
    let str = `Wrong Answer. Correct answer is \"${correctAnswer}\".`;
    let text = this.document.createTextNode(str);
    result.appendChild(text);
    result.classList.add('wrong');
  },
  markNoAnswer: function(question, correctAnswer) {
    let result = question.querySelector('p.result');
    let str = `You did not answer this question. Correct answer is \"${correctAnswer}\".`;
    let text = this.document.createTextNode(str);
    result.appendChild(text);
    result.classList.add('wrong');
  },
  renderQuestions: function() {
    this.questions.forEach(question => {
      this.document.querySelector('fieldset').insertAdjacentHTML('beforeend', this.questionTemplate(question));
    });
  },

}
document.addEventListener('DOMContentLoaded', function() {
  quizApp.init(document, questions, answerKey);
});