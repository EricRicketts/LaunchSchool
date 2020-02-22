function compareVersions(version1, version2) {
  if (invalidFormat(version1) || invalidFormat(version2)) {
    return null;
  }
  let [version1StrArr, version2StrArr] = normalizeVersionNumbers(version1, version2);
  let comparison = 0;
  let lengthOfVersionNumber = version1StrArr.length;

  for (let i = 0; i < lengthOfVersionNumber; i += 1) {
    let version1Part = Number.parseInt(version1StrArr[i], 10);
    let version2Part = Number.parseInt(version2StrArr[i], 10);

    if(version1Part > version2Part) {
      comparison = 1;
      return comparison;
    } else if (version1Part < version2Part) {
      comparison = -1;
      return comparison;
    }
  }

  return comparison;
}

function invalidFormat(version) {
  let invalidNumericParts = /[^0-9]+/g;
  let versionDelimiter = '.';

  let versionNumericParts = version.split(versionDelimiter);

  return versionNumericParts.some(function(numericPart) {
    return numericPart === '' || invalidNumericParts.test(numericPart);
  });
}

function normalizeVersionNumbers(version1, version2) {
  let versionDelimiter = '.';
  let version1StrArr = version1.split(versionDelimiter);
  let version2StrArr = version2.split(versionDelimiter);
  let version1NumParts = version1StrArr.length;
  let version2NumParts = version2StrArr.length;

  if (version1NumParts > version2NumParts) {
    version2StrArr = padWithZeros(version2StrArr, version1NumParts);
  } else if (version2NumParts > version1NumParts) {
    version1StrArr = padWithZeros(version1StrArr, version2NumParts);
  }

  return [version1StrArr, version2StrArr];
}

function padWithZeros(versionStrArr, desiredNumberOfParts) {
  let copyOfVersionStrArr = versionStrArr.slice();
  let numberOfZeros = desiredNumberOfParts - versionStrArr.length;

  for (let i = 0; i < numberOfZeros; i += 1) {
    copyOfVersionStrArr.push('0');
  }

  return copyOfVersionStrArr;
}


export { compareVersions };