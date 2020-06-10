import { extend, professional, Doctor, Professor } from "../code/second_person";

describe('JS225 Object Oriented Javascript', function () {
  describe('Exercises Object Creation Patterns', function () {
    describe('Exercise Four', function () {
      let doctor, professor, results, expected;
      beforeEach(() => {
        doctor = extend(new Doctor('Elmer', 'Fudd', 30, 'Male', 'Pediatrics'), professional);
        professor = extend(new Professor('Wile E', 'Coyote', 28, 'Male', 'Systems Engineering'), professional);
      });

      it('extend adds methods to doctor and professor objects', function () {
        results = [
          doctor.invoice(), doctor.payTax(), professor.invoice(), professor.payTax()
        ];
        expected = [
          'Elmer Fudd is Billing customer', 'Elmer Fudd Paying taxes',
          'Wile E Coyote is Billing customer', 'Wile E Coyote Paying taxes'
        ];
        expect(results).toEqual(expected);
      });

      it('modifications to professional are reflected in current doctor and professor objects', function () {
        professional.invoice = function() {
          return `${this.fullName()} is Asking customer to pay`;
        }
        professional.payTax = function() {
          return `${this.fullName()} is being Forced to pay taxes`;
        }
        results = [
          doctor.invoice(), doctor.payTax(), professor.invoice(), professor.payTax()
        ];
        expected = [
          'Elmer Fudd is Asking customer to pay', 'Elmer Fudd is being Forced to pay taxes',
          'Wile E Coyote is Asking customer to pay', 'Wile E Coyote is being Forced to pay taxes'
        ];
        expect(results).toEqual(expected);
      });
    });
  }); 
});