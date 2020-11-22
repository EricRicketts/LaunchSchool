document.addEventListener('DOMContentLoaded', function() {
  let allAnchorsWithDataSets = document.querySelectorAll('a[data-block]');
  let allArticlesWithDataSets = document.querySelectorAll('article[data-block]');

  Array.from(allAnchorsWithDataSets).forEach(anchor => {
    anchor.addEventListener('click', event => {
      event.preventDefault();
      let selectedDataSet = event.target.dataset.block;
      Array.from(allArticlesWithDataSets).forEach(article => {
        if (article.dataset.block === selectedDataSet) {
          article.style.display = 'block';
        }  else {
          article.style.display = 'none';
        }
      });
    });
  })
});