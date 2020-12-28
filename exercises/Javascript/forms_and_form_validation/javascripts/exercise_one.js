function attachRequiredEventHandler(form, nonRequiredElement) {

  form.addEventListener('focusin', event => {
    event.target.classList.remove('input-error');
    let span = event.target.nextElementSibling;
    span.classList.remove('show-error');
    span.classList.add('hide-error');
  });

  form.addEventListener('focusout', event => {
    let span = event.target.nextElementSibling;
    if (event.target === nonRequiredElement) {
      return;
    } else if (event.target.validity.valueMissing) {
      span.classList.remove('hide-error');
      span.classList.add('show-error');
      event.target.classList.add('input-error');
    }
  });
}
document.addEventListener('DOMContentLoaded', function() {
  let form = document.querySelector('form');
  let phone = document.getElementById('phone');

  attachRequiredEventHandler(form, phone);
});