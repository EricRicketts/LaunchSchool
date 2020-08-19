let arr = [];
function recordContextMenuAction(event, arr) {
  let element = event.target;
  let immediateText = Array.from(element.childNodes).reduce((str, node) => {
    if (node.nodeType === Node.TEXT_NODE) {
      str += node.textContent.trim();
    }
    return str;
  }, '');
  arr.push(immediateText);
}

document.addEventListener('DOMContentLoaded', () => {
  let main = document.getElementById('main');
  let section = document.getElementById('sub');

  [main, section].forEach(element => {
    element.addEventListener('contextmenu', event => {
      event.preventDefault();
      event.stopPropagation();
      recordContextMenuAction(event, arr);
    });
  });
});