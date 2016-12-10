// pull in desired CSS/SASS files
require('materialize-css/dist/css/materialize.min.css');
require('font-awesome/css/font-awesome.css');

require( './styles/main.scss' );
var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed 
require( 'materialize-css/dist/js/materialize.min.js' );

// inject bundled Elm app into div#main
var Elm = require( '../elm/Main' );
Elm.Main.embed( document.getElementById( 'main' ) );
