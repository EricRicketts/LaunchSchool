import { greet, greetFix } from '../code/greet';

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise One', function () {

    it('has an incorrect return value', function () {
        let result = greet('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');
        let resultLength = result.length;

        for (let i = 0; i < resultLength; i += 1) {
            expect(result[i]).toMatch(/function randomGreeting\(\)/);
        }
    });

    it('debugged code, fixed return values', function () {
        let greetingPrefixes = [
            'Hello', 'Howdy', 'Hi', 'Hey there', 'What\'s up',
            'Greetings', 'Salutations', 'Good to see you'
        ];
        let result = greetFix('Hannah', 'Jose', 'Beatrix', 'Julie', 'Ian');
        let resultLength = result.length;

        for (let i = 0; i < resultLength; i += 1) {
            let greeting = result[i];
            let prefixEndingLocation = greeting.search(/,/);
            let prefix = greeting.slice(0, prefixEndingLocation);
            expect(greetingPrefixes).toContain(prefix);
        }

    });
});