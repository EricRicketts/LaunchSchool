function wordCap(str) {
   const regex = /("\w+")|((\b[a-zA-Z])([a-zA-Z]*\b))/g;

   return str.replace(regex, function(match, p1, p2, p3, p4) {
      return !!p1 ? p1 : p3.toUpperCase() + p4.toLowerCase();
   });
}

function wordCapAlternate(str) {
  let strArr = str.split(/\s/);

  return strArr.map(function(word) {
    let quotedWord = /"\w+"/;
    return !!word.match(quotedWord) ? word : word[0].toUpperCase() + word.slice(1).toLowerCase();
  }).join(' ');
}

function wordCapLaunchSchool(str) {
  return str.split(/\s/).map(function(word) {
    return word.slice(0, 1).toUpperCase() + word.slice(1).toLowerCase();
  }).join(' ');
}
export { wordCap, wordCapAlternate, wordCapLaunchSchool };

/*
The Launch School solution turns out to be much cleaner, if we do encounter
an quoted word we still upcase the first character and then downcase the rest
as upcasing a non-alphabetic character returns the original character.  Doing
this means I do not need any conditional logic
 */