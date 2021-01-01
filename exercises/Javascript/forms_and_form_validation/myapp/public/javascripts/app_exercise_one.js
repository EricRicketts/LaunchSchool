let AppExerciseOne = {
  form: null,
  inputs: null,
  document: null,
  handleBlur: function(event) {
    if (this.form.checkValidity()) {
      let formErrors = this.document.getElementById('form_errors');
      this.removeAllChildNodes(formErrors);
    }
    let element = event.target;
    this.validateControl(element);
  },
  handleFocus: function(event) {
    let element = event.target;
    let errorContainer = element.nextElementSibling;
    this.removeAllChildNodes(errorContainer);
    element.classList.remove('input_error');
  },
  handleFormSubmit: function(event) {
    event.preventDefault();
    let formErrors = this.document.getElementById('form_errors');
    if (this.form.checkValidity()) {
      this.removeAllChildNodes(formErrors);
      console.log('form submitted');
    } else {
      let errorMessage = this.document.createTextNode('Form cannot be submitted until errors are corrected.');
      formErrors.appendChild(errorMessage);
      this.validateFormInputs();
      return false;
    }
  },
  handlePatternMismatch: function(element) {
    let id = element.getAttribute('id');
    let labelText = this.document.querySelector(`label[for=${id}]`).textContent;
    let errorContainer = element.nextElementSibling;
    this.removeAllChildNodes(errorContainer);
    let errorMessage;
    if (id === 'password') {
      errorMessage = document.createTextNode(`${labelText} must be at least 10 characters long.`);
    } else {
      errorMessage = document.createTextNode(`Please enter a valid ${labelText}.`);
    }
    errorContainer.appendChild(errorMessage);
  },
  handleValueAbsence: function(element) {
    let id = element.getAttribute('id');
    let labelText = this.document.querySelector(`label[for=${id}]`).textContent;
    let errorMessage = this.document.createTextNode(`${labelText} is a required field.`);
    let errorContainer = element.nextElementSibling;
    this.removeAllChildNodes(errorContainer);
    errorContainer.appendChild(errorMessage);

    element.classList.add('input_error');
  },
  init: function(document) {
    this.document = document;
    this.form = document.querySelector('form');
    this.inputs = document.querySelectorAll('form input');
    Array.from(this.inputs).forEach(input => {
      input.addEventListener('focus', event => this.handleFocus(event));
      input.addEventListener('blur', event => this.handleBlur(event));
    });
    this.form.addEventListener('submit', event => this.handleFormSubmit(event));
  },
  removeAllChildNodes: function(element) {
    while (element.firstChild) {
      element.removeChild(element.lastChild);
    }
  },
  validateControl: function(element) {
    if (element.validity.valueMissing) {
      this.handleValueAbsence(element);
      return false;
    } else if (element.validity.patternMismatch) {
      this.handlePatternMismatch(element);
      return false;
    }

    return true;
  },
  validateFormInputs: function() {
    Array.from(this.inputs).forEach(input => {
      this.validateControl(input);
    });
  }
}

export { AppExerciseOne as default };