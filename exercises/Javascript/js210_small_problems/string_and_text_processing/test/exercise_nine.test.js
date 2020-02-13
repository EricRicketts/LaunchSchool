import { searchWord } from "../code/search_word_part_one";

describe('Exercises JS210 Small Problems String And Text Processing Exercise Nine', function () {
  it('should find the number of occurrences of a word in text', function () {
     let text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium' +
       'doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore ' +
       'veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam ' +
       'voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni ' +
       'dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ' +
       'ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora ' +
       'incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis ' +
       'nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ' +
       'Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, ' +
       'vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';
     let str = 'sed';

     expect(searchWord(str, text)).toBe(3);
  });
});