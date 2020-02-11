import { processBands} from "../code/format_band";

describe('LS215 List Processing And Functional Abstractions Practice Problem Format Band', function () {
  let bands, originalBands, expected;
  beforeEach(() => {
    bands = [
      { name: 'sunset rubdown', country: 'UK', active: false },
      { name: 'women', country: 'Germany', active: false },
      { name: 'a silver mt. zion', country: 'Spain', active: true },
    ];
    originalBands = bands = [
      { name: 'sunset rubdown', country: 'UK', active: false },
      { name: 'women', country: 'Germany', active: false },
      { name: 'a silver mt. zion', country: 'Spain', active: true },
    ];
    expected = [
      { name: 'Sunset Rubdown', country: 'Canada', active: false },
      { name: 'Women', country: 'Canada', active: false },
      { name: 'A Silver Mt Zion', country: 'Canada', active: true },
    ];
  });

  it('should process bands according to requirements, leaves original data intact', function () {
    let result = processBands(bands);
    expect(result).toEqual(expected);
    expect(bands).toEqual(originalBands);
  });
});