// pull in desired CSS/SASS files
require('materialize-css/dist/css/materialize.min.css');
require('font-awesome/css/font-awesome.css');

require( '../elm/Stylesheets' );

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );

var app = Elm.Main.fullscreen();

app.ports.saveStorage.subscribe(function(args) {
  var [storageObject, isLocalStorage] = args;
  Object.keys(storageObject).forEach(function (key) {
    storage(isLocalStorage).setItem(key, JSON.stringify(storageObject[key]));
  });
});

app.ports.doloadStorage.subscribe(function(storageKey) {
  loadFromStorage(storageKey);
});

var loadFromStorage = function(storageKey) {
  var item = sessionStorage.getItem(storageKey) || localStorage.getItem(storageKey);
  var fullItem = {};
  if (item === null) {
    app.ports.loadStorage.send('Nothing');
  } else {
    fullItem[storageKey] = JSON.parse(item);
    app.ports.loadStorage.send(JSON.stringify(fullItem));
  }
}

var storage = function(isLocalStorage) {
  return isLocalStorage ? localStorage : sessionStorage;
}
