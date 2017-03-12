// pull in desired CSS/SASS files
require('materialize-css/dist/css/materialize.min.css');
require('font-awesome/css/font-awesome.css');

require( '../elm/Stylesheets' );
require( 'materialize-css/dist/js/materialize.min.js' );
require('./ports/storage.js');
require('./ports/infinitescroll.js');

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );

var app = Elm.Main.fullscreen();

var storage = new Storage();

var infiniteScroll = new InfiniteScroll();

storage.init(app);
infiniteScroll.init(app);

window.onscroll = function () {
  infiniteScroll.loadAction('collection', app);
};
