let AppExerciseFour = {
  form: null,
  inputs: null,
  document: null,
  blockNonAlpha: function(event) {
    const allowedNameChars = /[a-zA-Z'\s]/;
    if (!allowedNameChars.test(event.data)) {
      event.preventDefault();
    }
  },
  blockNonNumeric: function(event) {
    const allowedNumerics = [
      '0', '1', '2', '3', '4', '5', '6',
      '7', '8', '9', '-', 'Backspace', 'Tab'
    ];
    if (!allowedNumerics.includes(event.key)) {
      event.preventDefault();
    }
  },
  createURIEncodedString(key, value) {
    let p = this.document.createElement('p');
    let urlString = encodeURIComponent(`${key}=${value}`);
    let text = this.document.createTextNode(urlString);
    p.appendChild(text);
    return p;
  },
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
    this.removeAllChildNodes(formErrors);
    if (this.form.checkValidity()) {
      this.removeAllChildNodes(formErrors);
      let formData = new FormData(this.form);
      let formContentDiv = this.document.getElementById('form_content');
      Array.from(formData.entries()).forEach(([key, value]) => {
        let passwordAndNotRequiredCheck = (key !== 'password' && key !== 'credit_card' && key !== 'phone');
        if (passwordAndNotRequiredCheck) {
          formContentDiv.appendChild(this.createURIEncodedString(key, value));
        }
        if (key === 'phone' && value.length !== 0) {
          formContentDiv.appendChild(this.createURIEncodedString(key, value));
        }
        if (key === 'credit_card' && value.length !==0) {
          let joinedPhoneNumber = value.split('-').join('');
          formContentDiv.appendChild(this.createURIEncodedString(key, joinedPhoneNumber));
        }
      });
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
    element.classList.add('input_error');
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
    let lastIndex = this.inputs.length - 1;
    let [firstName, lastName] = [this.inputs[0], this.inputs[1]];
    let [phone, creditCard] = [this.inputs[lastIndex - 1], this.inputs[lastIndex]];
    Array.from(this.inputs).forEach(input => {
      input.addEventListener('focus', event => this.handleFocus(event));
      input.addEventListener('blur', event => this.handleBlur(event));
    });
    this.form.addEventListener('submit', event => this.handleFormSubmit(event));
    [firstName, lastName].forEach(element => {
      element.addEventListener('beforeinput', event => this.blockNonAlpha(event));
    });
    [phone, creditCard].forEach(element => {
      element.addEventListener('keydown', event => this.blockNonNumeric(event));
    })
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

export { AppExerciseFour as default };