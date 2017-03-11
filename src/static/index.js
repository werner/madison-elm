// pull in desired CSS/SASS files
require('materialize-css/dist/css/materialize.min.css');
require('font-awesome/css/font-awesome.css');

require( '../elm/Stylesheets' );
require( 'materialize-css/dist/js/materialize.min.js' );
require('./ports/storage.js');
require('./ports/infinitescroll.js');

var storage = new Storage();

var infiniteScroll = new InfiniteScroll();

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );

var app = Elm.Main.fullscreen();

app.ports.saveStorage.subscribe(function(args) {
  var [storageObject, isLocalStorage] = args;
  Object.keys(storageObject).forEach(function (key) {
    storage.getStorageType(isLocalStorage).setItem(key, JSON.stringify(storageObject[key]));
  });
});

app.ports.doloadStorage.subscribe(function(storageKey) {
  storage.loadFromStorage(storageKey, app);
});

window.onscroll = function () {
  var wrapper = document.getElementsByClassName('collection')[0];
  var lastItem = wrapper.childNodes[wrapper.childNodes.length - 1];

  if (infiniteScroll.isElementInViewport(lastItem)) {
    infiniteScroll.lastItem('currentUser', app);
  }
};
