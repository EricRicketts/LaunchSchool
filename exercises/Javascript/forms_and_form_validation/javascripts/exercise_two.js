function attachEventHandlers(form, document) {
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
function deleteAllChildNodes(element) {
  while (element.firstChild) {
    element.removeChild(element.lastChild);
  }
}
function removeAllErrors(inputElement, span, secondSpan) {
  inputElement.classList.remove('input-error');
  span.classList.remove('show-error');
  span.classList.add('hide-error');
  if (secondSpan) {
    secondSpan.classList.remove('show-error');
    secondSpan.classList.add('hide-error');
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
function inputModeHandler(element) {
  if (element.nodeName === 'INPUT') {
    element.classList.remove('input-error');
    let span = element.nextElementSibling;
    let secondSpan;
    if (span.nextElementSibling) { secondSpan = span.nextElementSibling; }
    removeAllErrors(element, span, secondSpan);
  }
}
document.addEventListener('DOMContentLoaded', function() {
  attachEventHandlers(document.querySelector('form'), document);
});