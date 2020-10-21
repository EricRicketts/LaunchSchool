$(window).on('load', function() {
  let $p = $('p');
  const output = 'Your favorite fruit is ';

  $('a').click(function(event) {
    event.preventDefault();
    let $anchor = $(this);
    $p.text(`${output}${$anchor.text()}`);
  });

  $('form').submit(function(event) {
    event.preventDefault();
    let $input = $(this).find('input[type=text]');
    $p.text(`${output}${$input.val()}`);
  });
});