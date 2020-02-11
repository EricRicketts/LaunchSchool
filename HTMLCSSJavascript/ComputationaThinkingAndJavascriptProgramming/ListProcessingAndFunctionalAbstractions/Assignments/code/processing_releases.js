function isValidRelease(release) {
  return release.id !== undefined && release.title !== undefined;
}

function getIdAndTitle(release) {
  return { id: release.id, title: release.title };
}

function processReleaseData(releases) {
  let validReleases = releases.filter(isValidRelease);
  return validReleases.map(getIdAndTitle);
}

export { processReleaseData };