document.addEventListener('DOMContentLoaded', () => {
  function turnRed(event) {
    event.currentTarget.style.background = 'red';
  }

  document.querySelector('.outer').addEventListener('click', turnRed);
  document.querySelector('.inner').addEventListener('click', turnRed);
});