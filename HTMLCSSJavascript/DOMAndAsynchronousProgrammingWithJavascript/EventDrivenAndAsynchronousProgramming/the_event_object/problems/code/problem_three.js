document.addEventListener('DOMContentLoaded', () => {
  function setColorOfChildren(color, ...children) {
    children.forEach((child) => {
      child.style.background = color;
    })
  }

  let x = document.querySelector('.x');

  document.addEventListener('mousemove', event => {
    x.style.top = String(event.clientY) + 'px';
    x.style.left = String(event.clientX) + 'px';
  });

  document.addEventListener('keypress', event => {
    let horizontal = document.querySelector('.horizontal');
    let vertical = document.querySelector('.vertical');
    let keyCode = event.code;
    switch (keyCode) {
      case 'KeyB': {
        setColorOfChildren('blue', horizontal, vertical);
        break;
      }
      case 'KeyG': {
        setColorOfChildren('green', horizontal, vertical);
        break;
      }
      case 'KeyR': {
        setColorOfChildren('red', horizontal, vertical);
        break;
      }
      default: {}
    }
  });
});