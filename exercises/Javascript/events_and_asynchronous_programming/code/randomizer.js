function randomizer(arr,...args) {
  let numberOfArgs = args.length;
  let numberOfTimeIntervals = 2*numberOfArgs;
  let count = 0;
  let timer =  setInterval(() => {
    count += 1;
    arr.push(count);
    if (count === numberOfTimeIntervals) { clearInterval(timer); }
  }, 1000);

  args.forEach(callback => {
    let randomTime = Math.floor(Math.random()*numberOfTimeIntervals + 1)*1000;
    setTimeout(() => {
      arr.push(callback())
    }, randomTime);
  })
}

module.exports = randomizer;