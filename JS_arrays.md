Methods . . . 
.push() => Adds to end of array
.unshift() => Adds to beginning of array


Spread Operators . . . 
const coolCities = ['New York', 'San Francisco'];
 
const allCities = ['Los Angeles', ...coolCities];
 
allCities;
// => ["Los Angeles", "New York", "San Francisco"]


const coolCats = ['Hobbes', 'Felix', 'Tom'];
 
const allCats = [...coolCats, 'Garfield'];
 
allCats;
// => ["Hobbes", "Felix", "Tom", "Garfield"]
