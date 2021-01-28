//  All problems reference the following URL: https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html

//  1.  Write some JavaScript code to retrieve a word count for each h2 heading on the page.
let allH2 = Array.from(document.getElementsByTagName('h2'));
let wordCount = [];
allH2.forEach(h2 => {
  wordCount.push(h2.textContent.match(/\w+/g).length);
});

console.log(wordCount); // got expected results [1, 3, 3, 3, 1, 2, 4, 1, 5, 2, 2, 1, 1, 2, 2, 2]

//  2.  The page has a table of contents with the title "Contents" and links to the different content sections on
//  "Naming and etymology," "Taxonomy and evolution," etc.
//
// Use three different DOM methods to retrieve a reference to the div element that contains the table of contents.
let tocOne = document.querySelector('#toc');
let tocTwo = document.getElementById('toc');
let tocThree = Array.from(document.querySelectorAll('.toc')).find(element => element.nodeName === 'DIV');

console.log(tocOne);
console.log(tocTwo);
console.log(tocThree);
// all three variables yield the same and correct result

//  3.  Write some JavaScript code to change the color for every odd indexed link in the table of contents to green.
let allLinks = Array.from(document.getElementsByTagName('A'));
allLinks.forEach((link, index) => {
  if (!(index % 2 === 0)) { link.style.color = 'green'; }
});

//  4.  Write some JavaScript code to retrieve the text of every thumbnail caption on the page.
let allThumbCaptions = Array.from(document.querySelectorAll('.thumbcaption')).map(thumbCaption => {
  return thumbCaption.textContent.trim();
});
console.log(allThumbCaptions);
//  logs all text in thumb captions, which are trimmed of whitespace

//  5.  You can think of the scientific classification of an animal as a series of key-value pairs. Here, the keys
//  are taxonomic ranks (Domain, Kingdom, Phylum, etc.). The values are the specific groups to which the animal belongs.
//
// Write JavaScript code that extracts the classification of animals from the web page and logs an Object that
// uses the ranks as keys and the groups as values. You may assume the taxonomic ranks to use as keys is provided
// for you as an array.
//
// I did not understand what was required so I looked at the answer, the key part I missed was the Scientific
// Classification table in the document

let ranks = ['Kingdom:', 'Phylum:', 'Class:', 'Order:', 'Family:', 'Genus:', 'Species:'];
let allTRs = Array.from(document.getElementsByTagName('tr'));
let scientificTRs = allTRs.filter(tr => {
  let td = tr.firstElementChild;
  return ranks.includes(td.textContent.trim());
});
console.log(scientificTRs);
let polarBearClassification = {};
scientificTRs.forEach(tr => {
  let rank = tr.firstElementChild.textContent.trim();
  let group = tr.lastElementChild.firstElementChild.textContent.trim();
  polarBearClassification[rank] = group;
});
console.log(polarBearClassification);

