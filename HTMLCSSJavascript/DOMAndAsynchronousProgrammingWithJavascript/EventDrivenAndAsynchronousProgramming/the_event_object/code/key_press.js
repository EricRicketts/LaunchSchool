function display(event) {
  let tbody = document.querySelector('table tbody');
  let tr = document.createElement('tr');
  tr.innerHTML = `
    <td class="type">${event.type}</td>
    <td class="key">${event.key}</td>
    <td class="shift">${event.shiftKey}</td>
    <td class="alt">${event.altKey}</td>
    <td class="ctrl">${event.ctrlKey}</td>
    <td class="meta">${event.metaKey}</td>
  `;

  tbody.appendChild(tr);
  document.body.scrollTop = document.body.scrollHeight;
}

document.addEventListener('keydown', display);
document.addEventListener('keyup', display);
document.addEventListener('keypress', display);

document.addEventListener('DOMContentLoaded', () => {
  let button = document.querySelector('#clear');
  button.addEventListener('click', () => {
    let tbody = document.querySelector('table tbody');
    tbody.innerHTML = '';
  });
});