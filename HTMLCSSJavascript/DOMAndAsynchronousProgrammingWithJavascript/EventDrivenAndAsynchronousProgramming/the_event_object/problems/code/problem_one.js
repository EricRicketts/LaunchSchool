function moveFigure(event) {
  let x = document.querySelector('.x');
  x.style.left = String(event.clientX) + 'px';
  x.style.top = String(event.clientY) + 'px';
}
document.addEventListener('DOMContentLoaded', () => {
  document.addEventListener('click', moveFigure);
});