const languages = [
  {
    name: 'Ruby',
    description: 'Ruby is a dynamic, reflective, object-oriented, ' +
      'general-purpose programming language. It was designed and developed in the mid-1990s ' +
      'by Yukihiro Matsumoto in Japan. According to its creator, Ruby was influenced by Perl, ' +
      'Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, ' +
      'including functional, object-oriented, and imperative. It also has a dynamic type ' +
      'system and automatic memory management.'
  },

  {
    name: 'JavaScript',
    description: 'JavaScript is a high-level, dynamic, untyped, and interpreted ' +
      'programming language. It has been standardized in the ECMAScript language ' +
      'specification. Alongside HTML and CSS, JavaScript is one of the three core ' +
      'technologies of World Wide Web content production; the majority of websites employ ' +
      'it, and all modern Web browsers support it without the need for plug-ins. JavaScript ' +
      'is prototype-based with first-class functions, making it a multi-paradigm language, ' +
      'supporting object-oriented, imperative, and functional programming styles.'
  },

  {
    name: 'Lisp',
    description: 'Lisp (historically, LISP) is a family of computer programming languages ' +
      'with a long history and a distinctive, fully parenthesized prefix notation. ' +
      'Originally specified in 1958, Lisp is the second-oldest high-level programming ' +
      'language in widespread use today. Only Fortran is older, by one year. Lisp has changed ' +
      'since its early days, and many dialects have existed over its history. Today, the best '+
      'known general-purpose Lisp dialects are Common Lisp and Scheme.'
  }
];

let MyLanguagesApp = {
  bindButtonHandlers: function() {
    let allButtons = Array.from(this.document.querySelectorAll('.prog_lang > button'));
    allButtons.forEach(button => {
      button.addEventListener('click', event => this.buttonHandler(event));
    });
  },
  buttonHandler: function(event) {
    let button = event.target;
    let p = button.previousElementSibling;
    if (button.textContent.includes('More')) {
      p.children[1].style.display = 'none';
      p.children[2].style.display = 'inline';
      button.textContent = 'Show Less';
    } else {
      p.children[1].style.display = 'inline';
      p.children[2].style.display = 'none';
      button.textContent = 'Show More';
    }
  },
  populateLanguageElements: function() {
    languages.forEach(obj => {
      let html = this.template({ name: obj.name, description: obj.description });
      let div = this.document.createElement('div');
      div.setAttribute('class', 'prog_lang');
      div.innerHTML = html;
      this.truncateAndHideDescription(div.querySelector('p'));
      this.document.getElementById('container').insertAdjacentElement('beforeend', div);
    });
  },
  removeAllChildren(element) {
    while (element.firstChild) {
      element.removeChild(element.lastChild);
    }
  },
  truncateAndHideDescription: function(p) {
    let splitDescription = p.textContent.split('').reduce((arr, char, index) => {
      index < 120 ? arr[0].push(char) : arr[1].push(char);
      return arr;
    }, [[], []]);
    this.removeAllChildren(p);
    [splitDescription[0].join(''), ' ... ', splitDescription[1].join('')].forEach((str, index) => {
      let span = this.document.createElement('span');
      let text = this.document.createTextNode(str);
      span.appendChild(text);
      if (index === 2) { span.style.display = 'none'; }
      p.appendChild(span);
    });
  },
  init: function(document) {
    let source = document.getElementById('prog_lang').innerHTML;
    this.document = document;
    this.template = Handlebars.compile(source);
    this.populateLanguageElements();
    this.bindButtonHandlers();
  }
}
document.addEventListener('DOMContentLoaded', function() {
  MyLanguagesApp.init(document);
});