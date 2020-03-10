
const RESERVED_KEYWORDS = ['break', 'case', 'catch', 'class', 'const', 'continue',
  'debugger', 'default', 'delete', 'do', 'else', 'enum', 'export', 'extends', 'finally',
  'for', 'function', 'if', 'implements', 'import', 'in', 'instanceof', 'interface',
  'let', 'new', 'package', 'private', 'protected', 'public', 'return', 'static',
  'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while',
  'with', 'yield'];

function isReserved(word) {

  RESERVED_KEYWORDS.forEach(function(keyword) {
    if (keyword === word) {
      return true;
    }
  });

  return false;
}

function isReservedFixed(word) {
  const numKeywords = RESERVED_KEYWORDS.length;

  for (let idx = 0; idx < numKeywords; idx += 1) {
    let keyword = RESERVED_KEYWORDS[idx];
    if (keyword === word) { return true; }
  }

  return false;
}

export { isReserved, isReservedFixed };
/*
this reason the first implementation did not work is that the forEach method will always cycle through
all array elements (that are not undefined) the only way to break out of the forEach method is to throw
an exception, return will not break out of the loop.  So, in this case even when a match is found to a
keyword, forEach will not break out of the loop even with the existence of the return keyword.  More
concisely the return value of the callback function is ignored as forEach always returns undefined.

Use a for loop instead which will break out of the loop upon executing the return statement.
 */