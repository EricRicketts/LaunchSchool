/*
function attachEventHandlers(form, document) {
  const invalidNameKeys = /[^A-Za-z'\s]/;
  let firstName = document.getElementById('first_name');
  let lastName = document.getElementById('last_name');
  let creditCardFields = document.querySelectorAll('input[name="credit_card"]');
  [firstName, lastName].forEach(element => checkKeyInputForNames(element, invalidNameKeys));
  Array.from(creditCardFields).forEach(field => checkKeyInputForCreditCard(field));
  form.addEventListener('focusin', event => inputModeHandler(event.target));
  form.addEventListener('focusout', event => checkEachInputElementForErrors(event.target));
  form.addEventListener('submit', event => {
    event.preventDefault();
    checkAllInputElementsBeforeSubmission(event, document);
  });
}
function checkAllInputElementsBeforeSubmission(event, document) {
  let errorParagraph = document.getElementById('form_errors');
  let inputs = [firstName, lastName, email, passwd, phone] = Array.from(event.target.querySelectorAll('form input'));
  let validityCheck = inputs.every(element => element.validity.valid);

  if (validityCheck) {
    deleteAllChildNodes(errorParagraph);
    alert('form is valid ready for submission.')
  } else {
    deleteAllChildNodes(errorParagraph);
    let errorText = document.createTextNode('Form cannot be submitted until the errors are corrected.');
    errorParagraph.appendChild(errorText);
    inputs.forEach(inputElement => checkEachInputElementForErrors(inputElement));
  }
}
function checkEachInputElementForErrors(element) {
  if (element.nodeName === 'INPUT') {
    let span = element.nextElementSibling;
    let secondSpan;
    if (span.nextElementSibling) { secondSpan = span.nextElementSibling; }

    if (element.validity.valid) {
      removeAllErrors(element, span, secondSpan)
    } else if (element.validity.valueMissing && element.id !== 'phone') {
      showFirstSpanError(span, element)
    } else if (element.validity.tooShort) {
      showSecondSpanError(span, secondSpan, element);
    } else if (element.validity.patternMismatch && element.id === 'email') {
      showSecondSpanError(span, secondSpan, element);
    } else if (element.validity.patternMismatch && element.id === 'phone') {
      showFirstSpanError(span, element);
    }
  }
}
function checkKeyInputForCreditCard(element) {
  element.addEventListener('keydown', event => {
    const validKeys = [
      '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'Backspace', 'Tab'
    ];
    if (!validKeys.includes(event.key)) { event.preventDefault(); }
  });
}
function checkKeyInputForNames(element, invalidKeys) {
  element.addEventListener('keydown', event => {
    if (invalidKeys.test(event.key)) { event.preventDefault(); }
  })
}
function deleteAllChildNodes(element) {
  while (element.firstChild) {
    element.removeChild(element.lastChild);
  }
}
function inputModeHandler(element) {
  if (element.nodeName === 'INPUT' && element.getAttribute('name') !== 'credit_card') {
    element.classList.remove('input-error');
    let span = element.nextElementSibling;
    let secondSpan;
    if (span.nextElementSibling) { secondSpan = span.nextElementSibling; }
    removeAllErrors(element, span, secondSpan);
  }
}
function removeAllErrors(inputElement, span, secondSpan) {
  if (inputElement.getAttribute('name') !== 'credit_card') {
    inputElement.classList.remove('input-error');
    span.classList.remove('show-error');
    span.classList.add('hide-error');
    if (secondSpan) {
      secondSpan.classList.remove('show-error');
      secondSpan.classList.add('hide-error');
    }
  }
}
function showFirstSpanError(span, inputElement) {
  span.classList.remove('hide-error');
  span.classList.add('show-error');
  inputElement.classList.add('input-error');
}
function showSecondSpanError(span, secondSpan, inputElement) {
  span.classList.remove('show-error');
  span.classList.add('hide-error');
  secondSpan.classList.remove('hide-error');
  secondSpan.classList.add('show-error');
  inputElement.classList.add('input-error');
}
document.addEventListener('DOMContentLoaded', function() {
  attachEventHandlers(document.querySelector('form'), document);
});
 */
import App from './app_exercise_two.js';
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});