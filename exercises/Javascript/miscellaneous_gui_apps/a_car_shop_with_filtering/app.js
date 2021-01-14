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
  buildSearchCriteria: function() {
    let searchObject = {};
    let filterButton = this.document.getElementById('filter');
    let allFilterSelects = Array.from(this.document.querySelectorAll('.menu > select'));
    allFilterSelects.forEach(select => {
      if (select.value !== '') {
        let key = select.getAttribute('name');
        searchObject[key] = select.value;
      }
    });
    return searchObject;
  },
  createFilteredCarObject: function(carData) {
    return carData.reduce((newObj, obj) => {
      newObj.filteredCars.push(obj);
      return newObj;
    }, { filteredCars: [] });
  },
  enableFilter: function() {
    let filteredDataSection = this.document.getElementById('car_data');
    let filteredCarData;
    let filter = this.document.getElementById('filter');
    filter.addEventListener('click', event => {
      let searchCriteria = this.buildSearchCriteria();
      if (Object.keys(searchCriteria).length === 0) {
        filteredCarData = cars;
      } else {
        filteredCarData = cars.filter(car => {
          return Object.keys(searchCriteria).every(searchKey => {
            return searchCriteria[searchKey] === String(car[searchKey]);
          });
        });
      }
      this.removeAllChildNodes(filteredDataSection);
      this.showFilteredCarData(filteredCarData);
    });
  },
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
  removeAllChildNodes(element) {
    while (element.firstChild) {
      element.removeChild(element.lastChild);
    }
  },
  showFilteredCarData: function(filteredCarData) {
    let source = this.document.getElementById('filtered_cars').innerHTML;
    let template = Handlebars.compile(source);
    let html = template(this.createFilteredCarObject(filteredCarData));
    this.document.getElementById('car_data').insertAdjacentHTML('afterbegin', html);
  },
  init: function(document) {
    this.document = document;
    this.populateMenus();
    this.registerPartialTemplate();
    this.showFilteredCarData(cars);
    this.enableFilter();
  }
}
document.addEventListener('DOMContentLoaded', function() {
  App.init(document);
});
/*
1.  Develop the search criteria, start with an empty object
2.  Cycle through all of the selects and build up the search criteria
    i.    If the value is not an empty string, '', then add the name of the select and the chosen
          value to the search object
    ii.   if the search object remains empty then we return the cars array.
    iii.  if the search object is not empty then we cycle through the cars array using Array.filter
    iv.   If the results section already exists, remove it and then run through the process of creating
          it again with the new data.
*/