function attachRequiredEventHandlers(form) {
  form.addEventListener('focusin', event => {
    if (event.target.nodeName === 'INPUT') {
      event.target.classList.remove('input-error');
      let span = event.target.nextElementSibling;
      let secondSpan;
      if (span.nextElementSibling) { secondSpan = span.nextElementSibling; }

      span.classList.remove('show-error');
      span.classList.add('hide-error');
      if (secondSpan) {
        secondSpan.classList.remove('show-error');
        secondSpan.classList.add('hide-error');
      }
    }
  });

  form.addEventListener('focusout', event => {
    if (event.target.nodeName === 'INPUT') {
      let span = event.target.nextElementSibling;
      let secondSpan;
      if (span.nextElementSibling) { secondSpan = span.nextElementSibling; }

      if (event.target.validity.valid) {
        removeAllErrors(event, span, secondSpan)
      } else if (event.target.validity.valueMissing && event.target.id !== 'phone') {
        showFirstSpanError(span, event)
      } else if (event.target.validity.tooShort) {
        showSecondSpanError(span, secondSpan, event);
      } else if (event.target.validity.patternMismatch && event.target.id === 'email') {
        showSecondSpanError(span, secondSpan, event);
      } else if (event.target.validity.patternMismatch && event.target.id === 'phone') {
        showFirstSpanError(span, event);
      }
    }
  });
}
function removeAllErrors(event, span, secondSpan) {
  event.target.classList.remove('input-error');
  span.classList.remove('show-error');
  span.classList.add('hide-error');
  if (secondSpan) {
    secondSpan.classList.remove('show-error');
    secondSpan.classList.add('hide-error');
  }
}
function showFirstSpanError(span, event) {
  span.classList.remove('hide-error');
  span.classList.add('show-error');
  event.target.classList.add('input-error');
}
function showSecondSpanError(span, secondSpan, event) {
  span.classList.remove('show-error');
  span.classList.add('hide-error');
  secondSpan.classList.remove('hide-error');
  secondSpan.classList.add('show-error');
  event.target.classList.add('input-error');
}
document.addEventListener('DOMContentLoaded', function() {
  let form = document.querySelector('form');

  attachRequiredEventHandlers(form);
});