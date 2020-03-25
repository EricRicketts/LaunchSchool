import { getCompatibleEvents, getCompatibleEventsFixed } from "../code/weekday_classes";

describe('JS210 Small Problems Debugging Exercise Ten', function () {
  let expectedBroken, expectedFixed, myCalendar, offeredClasses;
  beforeEach(() => {
    expectedBroken = [
      'Web Security Fundamentals', 'Pranayama Yoga For Beginners', 'Mike\'s Hikes',
      'Gordon Ramsey Master Class', 'Powerboating 101', 'Discover Parachuting'
    ];
    expectedFixed = ["Mike's Hikes", "Powerboating 101"];

    myCalendar = {
      "2018-08-13": ["JS debugging exercises"],
      "2018-08-14": ["Read 'Demystifying Rails'", "Settle health insurance"],
      "2018-08-15": ["Read 'Demystifying Rails'"],
      "2018-08-16": [],
      "2018-08-30": ["Drone video project plan"],
      "2018-09-10": ["Annual servicing of race bike"],
      "2018-09-12": ["Study"],
      "2018-11-02": ["Birthday Party"],
      "2018-11-03": ["Birthday Party"],
    };

    offeredClasses = {
      "Back To The Future Movie Night": ["2018-07-30"],
      "Web Security Fundamentals": ["2018-09-10", "2018-09-11"],
      "Pranayama Yoga For Beginners": ["2018-08-30", "2018-08-31", "2018-09-01"],
      "Mike's Hikes": ["2018-08-16"],
      "Gordon Ramsey Master Class": ["2018-09-11", "2018-09-12"],
      "Powerboating 101": ["2018-09-15", "2018-09-16"],
      "Discover Parachuting": ["2018-11-02"],
    };
  });

  it('should give too many classes', function () {
    expect(getCompatibleEvents(offeredClasses, myCalendar)).toEqual(expectedBroken);
  });

  it('should give correct classes', function () {
    expect(getCompatibleEventsFixed(offeredClasses, myCalendar)).toEqual(expectedFixed);
  });
});