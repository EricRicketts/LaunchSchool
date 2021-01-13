const cars = [
  { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];
document.addEventListener('DOMContentLoaded', function() {

});
/*
  1.  Load the car data
      i.    image
      ii.   make and model
      iii.  price
      iv.   year manufactured
      v.    you can add more data if you want to
  2.  Load the select boxes
      i.    they will be select elements but their values must be loaded by Javascript.
      ii.   select boxes are:
            a.  makes
            b.  models
            c.  years
            d.  price
            e.  filter button - all select fields initialized to 'All'
  3.  The order in which the above two are executed is not that pertinent
  4.  when the filter button is selected the following happens:
      i.    take each selected field from the select element and make it a search criteria
      ii.   if the selected field is 'All' then that field is not used as a search criteria
      iii.  if all fields are 'All' then return the entire list
*/