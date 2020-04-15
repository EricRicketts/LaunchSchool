function initializeLights(numberOfLights) {
  let lights = {};
  for (let i = 1; i <= numberOfLights; i += 1) { lights[i] = false };

  return lights;
}

function lightsOn(numberOfLights) {
  let lights = initializeLights(numberOfLights);
  toggleAllLightsIteratingFor(numberOfLights, lights);

  return selectAllLightsOn(lights);
}

function selectAllLightsOn(lights) {
  let lightsOn = Object.keys(lights).filter((light) => lights[light]);
  return lightsOn.map((lightNumber) => Number(lightNumber))
}

function toggleAllLightsIteratingFor(numberOfLights, lights) {
  for (let lightNumber = 1; lightNumber <= numberOfLights; lightNumber += 1) {
    Object.keys(lights).forEach((light) => {
      if (light % lightNumber === 0) { lights[light] = toggleLight(lights[light]); };
    });
  }
}

function toggleLight(light) {
  return !light;
}

export { lightsOn };