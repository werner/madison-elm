require('./storage.js');

(function(window){
  'use strict'

  function InfiniteScroll(){};

  InfiniteScroll.prototype.isElementInViewport = function(el) {
    var rect = el.getBoundingClientRect();

    return (
      rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  };

  InfiniteScroll.prototype.lastItem = function(storageKey, app) {
    var storage = new Storage();
    var value = storage.getValueFromStorage(storageKey);

    var fullItem = {};
    if (value !== null) {
      fullItem[storageKey] = value;
      app.ports.loadScrollAction.send(JSON.stringify(fullItem));
    }

  };

  window.InfiniteScroll = InfiniteScroll;

})(window);
