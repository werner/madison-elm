// pull in desired CSS/SASS files
require('materialize-css/dist/css/materialize.min.css');
require('font-awesome/css/font-awesome.css');

require( './styles/main.scss' );
require( '../elm/Stylesheets' );
var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 
require( 'materialize-css/dist/js/materialize.min.js' );

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );

var app = Elm.Main.fullscreen();

app.ports.saveStorage.subscribe(function(storageObject) {
  Object.keys(storageObject).forEach(function (key) {
    localStorage.setItem(key, JSON.stringify(storageObject[key]));
  });
});

app.ports.doloadStorage.subscribe(function(storageKey) {
  loadFromLocalStorage(storageKey);
});

var loadFromLocalStorage = function(storageKey) {
  var item = localStorage.getItem(storageKey);
  var fullItem = {};
  if (item === null) {
    app.ports.loadStorage.send('Nothing');
  } else {
    fullItem[storageKey] = JSON.parse(item);
    app.ports.loadStorage.send(JSON.stringify(fullItem));
  }
}
