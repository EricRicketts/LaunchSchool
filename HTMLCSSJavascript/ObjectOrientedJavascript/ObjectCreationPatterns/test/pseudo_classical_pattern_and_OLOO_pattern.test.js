import { Point, PointOLOO } from "../code/pseudo_classical_pattern_and_OLOO_pattern";

describe('JS225 Object Oriented Javascript', function () {
  describe('Pseudo Classical and OLOO Patterns', function () {
    let pointA, pointB, results, expected;
    describe('Pseudo Classical Pattern', function () {
      beforeEach(() => {
        pointA = new Point(30, 40);
        pointB = new Point(20);
      });
      it('points should be instances of Point', function () {
        results = [pointA instanceof Point, pointB instanceof Point];
        expected = [true, true];
        expect(results).toEqual(expected);
      });

      it('should be able to call the methods of the Point prototype', function () {
        results = [pointA.distanceToOrigin(), pointB.onXAxis()];
        expected = [50, true];
        expect(results).toEqual(expected);
      });
    });
    describe('OLOO Pattern', function () {
      beforeEach(() => {
        pointA = Object.create(PointOLOO).init(30, 40);
        pointB = Object.create(PointOLOO);
      });
      it('should still be able to identify immediate prototype of object', function () {
        results = [Object.getPrototypeOf(pointA), Object.getPrototypeOf(pointB)];
        expected = [PointOLOO, PointOLOO];
        expect(results).toEqual(expected);
      });

      it('should still be able to call the methods', function () {
        results = [pointA.distanceToOrigin(), pointB.onXAxis(), pointB.onYAxis()];
        expected = [50, true, true];
        expect(results).toEqual(expected);
      });
    });
  }); 
});