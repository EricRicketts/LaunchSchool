import { Doctor, GraduateStudent, Person, Professor, Student } from "../code/first_person";

describe('JS225 Object Oriented Javascript', function () {
  describe('Exercises: Object Creation Patterns', function () {
    describe('Exercise Three', function () {
      let results, expected;
      describe('Person', function () {
        let person;
        beforeEach(() => {
          person = new Person('Elmer', 'Fudd', 35, 'male');
        });
        it('should display all state values', function () {
          results = [person.firstName, person.lastName, person.age, person.gender];
          expected = ['Elmer', 'Fudd', 35, 'male'];
          expect(results).toEqual(expected);
        });

        it('should display results from invoking all four methods', function () {
          results = [person.fullName(), person.communicate(), person.eat(), person.sleep()];
          expected = ['Elmer Fudd', 'Communicating', 'Eating', 'Sleeping'];
          expect(results).toEqual(expected);
        });

        it('person should be an instance of Person', function () {
          expect(person instanceof Person).toBe(true);
        });
      });
      describe('Doctor', function () {
        let doctor;
        beforeEach(() => {
          doctor = new Doctor('Bugs', 'Bunny', 25, 'male', 'Pediatrics');
        });
        it('doctor should be an instance of Doctor and Person', function () {
          expect(doctor instanceof Doctor).toBe(true);
          expect(doctor instanceof Person).toBe(true);
        });

        it('should return both unique and inherited properties', function () {
          results = [
            doctor.firstName, doctor.lastName, doctor.age, doctor.gender, doctor.specialization
          ];
          expected = ['Bugs', 'Bunny', 25, 'male', 'Pediatrics'];
          expect(results).toEqual(expected);
        });

        it('should have all of the inherited properties of Person', function () {
          results = [
            doctor.fullName(), doctor.eat(), doctor.sleep(), doctor.communicate()
          ];
          expected = ['Bugs Bunny', 'Eating', 'Sleeping', 'Communicating'];
          expect(results).toEqual(expected);
        });

        it('should return values from unique methods', function () {
          expect(doctor.diagnose()).toBe('Diagnosing');
        });
      });
      describe('Professor', function () {
        let professor;
        beforeEach(() => {
          professor = new Professor('Foghorn', 'Leghorn', 30, 'male', 'Physics');
        });
        it('should be an instance of Professor and Person', function () {
          results = [professor instanceof Professor, professor instanceof Person];
          expected = [true, true];
          expect(results).toEqual(expected);
        });

        it('retains all of the Person properties', function () {
          results = [
            professor.firstName, professor.lastName, professor.age, professor.gender
          ];
          expected = ['Foghorn', 'Leghorn', 30, 'male'];
          expect(results).toEqual(expected);
        });

        it('should have its own properties', function () {
          expect(professor.subject).toEqual('Physics');
        });

        it('should retain all of the methods of Person', function () {
          results = [
            professor.fullName(), professor.eat(), professor.communicate(), professor.sleep()
          ];
          expected = ['Foghorn Leghorn', 'Eating', 'Communicating', 'Sleeping'];
          expect(results).toEqual(expected);
        });

        it('should have its own methods', function () {
          expect(professor.teach()).toBe('Teaching');
        });
      });
      describe('Student', function () {
        let student;
        beforeEach(() => {
          student = new Student('Yosemite', 'Sam', 33, 'male', 'BS Mathematics');
        });
        it('retains all of the Person properties', function () {
          results = [
            student.firstName, student.lastName, student.age, student.gender
          ];
          expected = ['Yosemite', 'Sam', 33, 'male'];
          expect(results).toEqual(expected);
        });

        it('should have its own properties', function () {
          expect(student.degree).toBe('BS Mathematics');
        });

        it('should retain all of the Person methods', function () {
          results = [
            student.fullName(), student.eat(), student.sleep(), student.communicate()
          ];
          expected = ['Yosemite Sam', 'Eating', 'Sleeping', 'Communicating'];
          expect(results).toEqual(expected);
        });

        it('should have its own methods', function () {
          expect(student.study()).toBe('Studying');
        });
      });
      describe('Graduate Student', function () {
        let graduateStudent;
        beforeEach(() => {
          graduateStudent = new GraduateStudent('Tasmanian', 'Devil', 27, 'male', 'BS Computer Science', 'MS Computer Science');
        });

        it('should be an instance of GraduateStudent, Student, and Person', function () {
          results = [
            graduateStudent instanceof GraduateStudent, graduateStudent instanceof Student,
            graduateStudent instanceof Person
          ];
          expected = [true, true, true];
          expect(results).toEqual(expected);
        });

        it('should have all of the properties of a Person', function () {
          results = [
            graduateStudent.firstName, graduateStudent.lastName,
            graduateStudent.age, graduateStudent.gender
          ];
          expected = ['Tasmanian', 'Devil', 27, 'male'];
          expect(results).toEqual(expected);
        });

        it('should have all the properties of a Student', function () {
          expect(graduateStudent.degree).toBe('BS Computer Science');
        });

        it('should have all the properties of a GraduateStudent', function () {
          expect(graduateStudent.graduateDegree).toBe('MS Computer Science');
        });

        it('should have all the methods of a Person', function () {
          results = [
            graduateStudent.fullName(), graduateStudent.communicate(),
            graduateStudent.eat(), graduateStudent.sleep()
          ];
          expected = ['Tasmanian Devil', 'Communicating', 'Eating', 'Sleeping'];
          expect(results).toEqual(expected);
        });

        it('should have all the methods of Student', function () {
          expect(graduateStudent.study()).toBe('Studying');
        });

        it('should have all the methods of GraduateStudent', function () {
          expect(graduateStudent.research()).toBe('Researching');
        });
      });
    });
  });
});