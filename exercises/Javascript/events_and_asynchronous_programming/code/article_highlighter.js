document.addEventListener('DOMContentLoaded', () => {
  const highlightClass = 'highlight';
  let main = document.querySelector('main');
  const articleRegx = /article-\d+/;

  function removeAllHighlights(node) {
    for (let index = 0; index < node.childNodes.length; index += 1) {
      if (node.classList.contains(highlightClass)) {
        node.classList.remove(highlightClass);
      }
      removeAllHighlights(node.childNodes[index]);
    }
  }

  document.addEventListener('click', event => {
    removeAllHighlights(document.body);
    let isAnchor = event.target.tagName === 'A';
    let targetHref = event.target.getAttribute('href');
    let isCorrectHref = articleRegx.test(targetHref);
    let isChildOfArticle = (event.target.parentElement.tagName === 'ARTICLE' &&
      articleRegx.test(event.target.parentElement.id));
    let isArticle = (event.target.tagName === 'ARTICLE' && articleRegx.test(event.target.id));

    if (isAnchor && isCorrectHref) {
      document.querySelector(targetHref).classList.add(highlightClass);
    } else if (isChildOfArticle) {
      event.target.parentElement.classList.add(highlightClass);
    } else if (isArticle) {
      event.target.classList.add(highlightClass);
    } else {
      main.classList.add(highlightClass);
    }
  });
});