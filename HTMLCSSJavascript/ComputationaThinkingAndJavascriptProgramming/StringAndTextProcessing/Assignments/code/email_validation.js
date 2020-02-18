function oneAmpersand(str) {
  let ampersandRegex = /@/g;
  return str.match(ampersandRegex).length === 1;
}

function isValidDomain(domainPart) {
  let validPattern = /([A-Za-z]+\.)+[A-Za-z]+$/g;
  let invalidPattern = /[^A-Za-z.]+/g;

  return validPattern.test(domainPart) && !invalidPattern.test(domainPart);
}

function isValidEmail(str) {
  let [local, domain] = str.split('@');

  return oneAmpersand(str) && isValidLocal(local) && isValidDomain(domain);
}

function isValidLocal(localPart) {
  let validChars = /^[A-Za-z0-9]+/g;
  let invalidChars = /[^A-Za-z0-9]+/g;

  return validChars.test(localPart) && !invalidChars.test(localPart)
}

export { isValidEmail };

/*
My solution is very similar to the Launch School solution though their
solution does not need the invalid cases because they test the pattern
all at once.
 */