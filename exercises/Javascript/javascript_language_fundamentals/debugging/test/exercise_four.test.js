import { wantToVisit, wantToVisitFixed, wantToVisitRefactor } from "../code/picky_museum_filter";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Four', function () {
  it('computer museum desired', function () {
    expect(wantToVisit('Computer Games Museum', 'Berlin')).toBe(true);
    expect(wantToVisitFixed('Computer Games Museum', 'Berlin')).toBe(true);
    expect(wantToVisitRefactor('Computer Games Museum', 'Berlin')).toBe(true);
  });

  it('science museum desired', function () {
    expect(wantToVisit('National Museum of Nature and Science', 'Tokyo')).toBe(true);
    expect(wantToVisitFixed('National Museum of Nature and Science', 'Tokyo')).toBe(true);
    expect(wantToVisitRefactor('National Museum of Nature and Science', 'Tokyo')).toBe(true);
  });

  it('Modern Art not from Any Warhol not desired', function () {
    expect(wantToVisit('Museum of Modern Art', 'New York')).toBe(false);
    expect(wantToVisitFixed('Museum of Modern Art', 'New York')).toBe(false);
    expect(wantToVisitRefactor('Museum of Modern Art', 'New York')).toBe(false);
  });

  it('no computer, no science, no modern art from Andy Warhold, and not in Amsterdam', function () {
    expect(wantToVisit('El Paso Museum of Archaeology', 'El Paso')).toBe(false);
    expect(wantToVisitFixed('El Paso Museum of Archaeology', 'El Paso')).toBe(false);
    expect(wantToVisitRefactor('El Paso Museum of Archaeology', 'El Paso')).toBe(false);
  });

  it('Science in Amsterdam is okay', function () {
    expect(wantToVisit('NEMO Science Museum', 'Amsterdam')).toBe(false); // should be true
    expect(wantToVisitFixed('NEMO Science Museum', 'Amsterdam')).toBe(true);
    expect(wantToVisitRefactor('NEMO Science Museum', 'Amsterdam')).toBe(true);
  });

  it('Modern Art must be from Andy Warhol', function () {
    expect(wantToVisit('National Museum of Modern Art', 'Paris')).toBe(false);
    expect(wantToVisitFixed('National Museum of Modern Art', 'Paris')).toBe(false);
    expect(wantToVisitRefactor('National Museum of Modern Art', 'Paris')).toBe(false);
  });

  it('Modern Art from Andy Warhol', function () {
    expect(wantToVisit('Andy Warhol Museum of Modern Art', 'Medzilaborce')).toBe(false); // should be true
    expect(wantToVisitFixed('Andy Warhol Museum of Modern Art', 'Medzilaborce')).toBe(true);
    expect(wantToVisitRefactor('Andy Warhol Museum of Modern Art', 'Medzilaborce')).toBe(true);
  });

  it('Modern Art from Amsterdam is desired to visit', function () {
    expect(wantToVisit('Moco: Modern Contemporary Art', 'Amsterdam')).toBe(false); // should be true
    expect(wantToVisitFixed('Moco: Modern Contemporary Art', 'Amsterdam')).toBe(true);
    expect(wantToVisitRefactor('Moco: Modern Contemporary Art', 'Amsterdam')).toBe(true);
  });

  it('Must be modern art from Andy Warhol or in Amsterdam', function () {
    expect(wantToVisit('Van Gogh Museum', 'Amsterdam')).toBe(false);
    expect(wantToVisitFixed('Van Gogh Museum', 'Amsterdam')).toBe(false);
    expect(wantToVisitRefactor('Van Gogh Museum', 'Amsterdam')).toBe(false);
  });
});