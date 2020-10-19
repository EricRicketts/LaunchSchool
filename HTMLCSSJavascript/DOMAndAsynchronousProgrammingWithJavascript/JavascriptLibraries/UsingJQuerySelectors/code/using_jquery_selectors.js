// 1. Use an element selector to find all h1 elements
let $h1Collection = $('h1');

// 2. Use an ID selector to find the first h1 element
let $firstH1 = $('#site_title');
$firstH1 = $h1Collection.closest('#site_title');

// 3. Use a descendant selector to find all the list items in the article element.
let $listItems = $('article li');

// 4. Find the third list item from the article element.
let $thirdListItem = $listItems.get(2); // returns the DOM Element
$thirdListItem = $listItems.eq(2); // returns a jQuery Collection of one element
$thirdListItem = $('article li').get(2); // returns the DOM Element
$thirdListItem = $('article li').eq(2); // returns a jQuery Collection of one element

// 5. Find the table element, then find all the odd-numbered table rows in that element.
let $oddTableRows = $('table > tbody > tr').odd();
$oddTableRows = $('table').find('tr').filter(':odd');
$oddTableRows = $('table').find('tr:odd');

// 6. Find the list item that contains the text ac ante, then locate the parent li element.
let $ul = $("li li:contains('ac ante')").parent()

// 7. Find the list item that contains the text ac ante, then find and return the next element.
let $foundLi = $('li').filter(function(index) {
  return $(this).text().match(/^ac ante$/);
}).next();

// 8. Find all the table cells in the table, then find the last cell from the collection.
let $lastCell = $('table td').last();

// 9. Find all the table cells that do not have a class of "protected".
let $nonProtectedCells = $("table td:not('.protected')");
$nonProtectedCells = $('table td').not('.protected');

// 10.  Find all the anchor elements that have an href value that begins with #.
let $emptyAnchors = $('a[href^="#"]');

// 11.  Find all elements that have a class name that contains "block".
let $allClassBlockElements = $('[class*="block"]');