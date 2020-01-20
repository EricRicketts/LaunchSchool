describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Eight', function () {
  let ceo, developer, scrumMaster, team, company;
  beforeEach(() => {
    ceo = {
      tasks: ['company strategy', 'resource allocation', 'performance monitoring'],
      salary: 0,
    };

    developer = {
      tasks: ['turn product vision into code'],
      salary: 0,
    };

    scrumMaster = {
      tasks: ['organize scrum process', 'manage scrum teams'],
      salary: 0,
    };

    team = {};

    company = {
      name: 'Space Design',
      team: team,
      projectedRevenue: 500000,
    };
  });

  it('All keys are converted to strings, so objects as keys are not unique', function () {
    team[ceo] = 'Kim';
    team[scrumMaster] = 'Alice';
    team[developer] = undefined;
    expect(company.team[ceo]).toBe(undefined);
  });

  it('Proper way to include the team to the company', function () {
    ceo.name = 'Kim';
    scrumMaster.name = 'Alice';
    team.ceo = ceo;
    team.scrumMaster = scrumMaster;
    team.developer = developer;
    expect(company.team.ceo.name).toBe('Kim');
    expect(company.team.scrumMaster.name).toBe('Alice');
  });
});
/*
the first assertion is undefined because Javascript must have strings as its object
keys, since three successive objects were given as keys they all are converted
to strings and the string of simply '[object Object]', the last assignment,
team[developer] = undefined, sets the value for the key '[object Object]'.
 */