function StackAndRegisterMachine() {
  this.register = 0;
  this.stack = [];
}

StackAndRegisterMachine.prototype.add = function () {
  let currentRegisterValue = this.print();
  this.register = currentRegisterValue + this.pop();
};

StackAndRegisterMachine.prototype.div = function () {
  let currentRegisterValue = this.print();
  let div = currentRegisterValue / this.pop();
  this.register = div >= 0 ? Math.floor(div) : Math.ceil(div);
};

StackAndRegisterMachine.prototype.mod = function () {
  let currentRegisterValue = this.print();
  this.register = currentRegisterValue % this.pop();
};

StackAndRegisterMachine.prototype.mult = function () {
  let currentRegisterValue = this.print();
  this.register = currentRegisterValue * this.pop();
};

StackAndRegisterMachine.prototype.print = function () {
  return this.register;
};

StackAndRegisterMachine.prototype.pop = function () {
  this.register = this.stack.pop();
  return this.print();
};

StackAndRegisterMachine.prototype.push = function () {
  this.stack.push(this.print());
};

StackAndRegisterMachine.prototype.sub = function () {
  let currentRegisterValue = this.print();
  this.register = currentRegisterValue - this.pop();
};

function minilang(instructionStream) {
  let machine = new StackAndRegisterMachine();
  let arrayOfInstructions = instructionStream.split(/\s+/);
  let results = [];
  let registerOperation = /\d+/;

  arrayOfInstructions.forEach((instruction) => {
    if (registerOperation.test(instruction)) {
      machine.register = Number.parseInt(instruction, 10);
    } else if (instruction === 'PRINT') {
      results.push(machine.print());
    }  else {
      machine[instruction.toLowerCase()]();
    }
  });

  return results;
}

export { minilang };