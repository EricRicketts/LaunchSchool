const fs = require('fs');
const path = require('path');
const { JSDOM } = require('jsdom');
import { nodesToArr } from "../code/nodes_to_array";

describe('Exercise Seven Nodes To Array', function () {
  let codeDirectory, options, expected, window, document, html;
  beforeEach(() => {
    options = {
      resources: 'usable',
      runScripts: 'dangerously'
    };
    codeDirectory = path.join(__dirname, '..', 'code');
  });

  it('only the body should have children', function () {
    html = fs.readFileSync(codeDirectory + '/exercise_seven_a.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    expected = ["BODY",[["HEADER#1",[]],["MAIN#2",[]],["FOOTER#3",[]]]];
    
    expect(nodesToArr(document)).toEqual(expected);
  });

  it('main element should show two children', function () {
    html = fs.readFileSync(codeDirectory + '/exercise_seven_b.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    expected = ["BODY",[["HEADER#1",[]],["MAIN#2",[["DIV#4",[]],["DIV#5",[]]]],["FOOTER#3",[]]]];
    
    expect(nodesToArr(document)).toEqual(expected);
  });

  it('div#1 has both direct and indirect children', function () {
    html = fs.readFileSync(codeDirectory + '/exercise_seven_c.html', 'utf8');
    window = new JSDOM(html, options).window;
    document = window.document;
    expected = ["BODY",[
      ["DIV#1",[
        ["DIV#4",[]],["DIV#5",[
          ["DIV#6",[]]
            ]
          ]
        ]
      ],
      ["DIV#2",[]],["DIV#3",[
        ["DIV#7",[]],["DIV#8",[]],["DIV#9",[]]
        ]
      ]
    ]
  ];

    expect(nodesToArr(document)).toEqual(expected);
  });
});