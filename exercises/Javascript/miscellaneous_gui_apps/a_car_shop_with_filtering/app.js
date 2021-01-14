const cars = [
  { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];
let App = {
  getMenuData: function() {
    let emptyData = { makes: [], models: [], prices: [], years: [] };
    let menuData = cars.reduce((newData, obj) => {
      Object.keys(obj).forEach(key => {
        if (key !== 'image') {
          let newDataKey = key + 's';
          if (!newData[newDataKey].includes(obj[key])) {
            newData[newDataKey].push(obj[key]);
          }
        }
      });
      return newData;
    }, emptyData);
    Object.values(menuData).forEach(values => {
      if (typeof values[0] === 'string') {
        values.sort();
      } else {
        values.sort((a, b) => a - b);
      }
    });
    return menuData;
  },
  populateMenus: function() {
    let menuData = this.getMenuData();
    let source = this.document.getElementById('menu_template').innerHTML;
    let template = Handlebars.compile(source);
    this.document.querySelector('#nav_container nav').insertAdjacentHTML('afterbegin', template(menuData));
  },
  registerPartialTemplate: function() {
    let source = this.document.getElementById('car_partial').innerHTML;
    Handlebars.registerPartial('carPartial', source);
  },
  showNonFilteredData: function() {
    let source = this.document.getElementById('filtered_cars').innerHTML;
    let template = Handlebars.compile(source);
    let filteredCars = cars.reduce((newObj, obj) => {
      newObj.filteredCars.push(obj);
      return newObj;
    }, { filteredCars: [] });
    let html = template(filteredCars);
    this.document.getElementById('nav_container').insertAdjacentHTML('afterend', html);
  },
  init: function(document) {
    this.document = document;
    this.populateMenus();
    this.registerPartialTemplate();
    this.showNonFilteredData();
  }
}
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
/*
1.  Load up the menus
    i.    Create a template for all of the menus
    ii.   get an array of all the keys except image which have all of the corresponding values, remove duplicates.
    iii.  the keys should be makes, models, years, and prices
    iii.  Grab the menu_template and get its inner html
    iv.   Iterate through makes, models, prices, and years
*/