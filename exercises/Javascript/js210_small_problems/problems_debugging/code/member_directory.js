var memberDirectory = {};

function clearMemberDirectory() {
  memberDirectory = {};
}

function isValidName(name) {
  return (/^\w+ \w+$/).test(name);
}

function isValidNameFix(name) {
  return (/^[A-Z][a-z]+\s[A-Z][a-z]+$/).test(name);
}

function isValidPhone(phone) {
  return (/^\d{3}-\d{4}$/).test(phone);
}

function validMemberInfo(name, phone) {
  return isValidName(name) && isValidPhone(phone);
}

function validMemberInfoFix(name, phone) {
  return isValidNameFix(name) && isValidPhone(phone);
}

function addMember(name, phone) {
  if (validMemberInfo(name, phone)) {
    memberDirectory[name] = phone;
  } else {
    // console.log('Invalid member information.');
    return 'Invalid member information';
  }
}

function addMemberFix(name, phone) {
  if (validMemberInfoFix(name, phone)) {
    memberDirectory[name] = phone;
  } else {
    return 'Invalid member information';
  }
}

export { memberDirectory, clearMemberDirectory, addMember, addMemberFix };

