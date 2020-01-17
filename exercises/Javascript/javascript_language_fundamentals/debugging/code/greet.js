function randomGreeting() {
    var words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
        'Greetings', 'Salutations', 'Good to see you'];

    var idx = Math.floor(Math.random() * words.length);

    words[idx];
}

function randomGreetingFix() {
    var words = ['Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
        'Greetings', 'Salutations', 'Good to see you'];

    var idx = Math.floor(Math.random() * words.length);

    return words[idx];
}

function greet() {
    var names = Array.prototype.slice.call(arguments);
    var i;
    var allGreetings = [];

    for (i = 0; i < names.length; i++) {
        var name = names[i];
        var greeting = randomGreeting;

        // used to have console.log(greeting + ', ' + name + '!');
        allGreetings.push(greeting + ', ' + name + '!');
    }

    return allGreetings;
}

function greetFix() {
    var names = Array.prototype.slice.call(arguments);
    var i;
    var allGreetings = [];

    for (i = 0; i < names.length; i++) {
        var name = names[i];
        var greeting = randomGreetingFix();

        // used to have console.log(greeting + ', ' + name + '!');
        allGreetings.push(greeting + ', ' + name + '!');
    }

    return allGreetings;
}

export { greet, greetFix };
/*
There are two problems with this code:
1.  In line 17, the local variable greeting is assigned a reference to a function, randomGreeting
but in line 20, the this function reference is not called, so the return value is the function
reference.
2.  Secondly in the function randomGreeting, there is no return keyword, so the function will
always returned undefined.
3.  Additionally, since the "+" operation is used and there is a string in the sequence,
all operands will be converted to strings and concatenated.
 */