describe('JS225 Object Oriented Javascript', function () {
  describe('Constructor Pattern', function () {
    let Lizard;
    beforeEach(() => {
      Lizard = function() {
        this.scamper = function() {
          return "I'm scampering!";
        }
      }
    });
    /*
      1.  What naming convention separates constructor functions from other functions?
      The first letter of the function name is capitalized. 
    */

    it('should return a TypeError without the use of the new keyword', function () {
      expect(() => { Lizard(); }).toThrow(TypeError);
      /*
        Original code was:
        let lizzy = Lizard();
        lizzy.scamper();
        However, we are not in the browser environment and are probably running in strict mode, so as executed,
        Lizard() returns a function expression however, "this" is undefined so it throws a TypeError because undefined
        cannot be given any properties. 
      */
    });

    it('a object is returned when Lizard is invoked with the new keyword', function () {
      let lizzy = new Lizard();
      expect(lizzy.scamper()).toBe("I'm scampering!");
    });
  });
});