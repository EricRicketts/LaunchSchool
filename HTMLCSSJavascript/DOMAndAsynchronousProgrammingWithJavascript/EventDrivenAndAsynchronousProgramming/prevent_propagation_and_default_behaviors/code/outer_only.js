document.addEventListener('DOMContentLoaded', () => {
  const turnRed = (event => {
    event.stopPropagation();
    event.currentTarget.style.background = 'red';
  });

  document.querySelector('.outer').addEventListener('click', turnRed, true);
  document.querySelector('.inner').addEventListener('click', turnRed);
});