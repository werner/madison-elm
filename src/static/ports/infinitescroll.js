require('./storage.js');

(function(window){
  'use strict'

  function InfiniteScroll(){};

  InfiniteScroll.prototype.partialOffSet = 0;

  InfiniteScroll.prototype.init = function(app) {
    var self = this;

    app.ports.initializeOffset.subscribe(function() {
      self.partialOffSet = 0;
    });
  }

  InfiniteScroll.prototype.isElementInViewport = function(el) {
    if (el === undefined) {
      return false;
    }

    var rect = el.getBoundingClientRect();

    return (
      rect.top >= 0 &&
        rect.left >= 0 &&
        rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
        rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  };

  InfiniteScroll.prototype.lastItem = function(storageKey, offset, app) {
    var storage = new Storage();
    var value = storage.getValueFromStorage(storageKey);

    var fullItem = {};
    if (value !== null) {
      fullItem[storageKey] = value;
      app.ports.loadScrollAction.send([JSON.stringify(fullItem), offset]);
    }
  };

  InfiniteScroll.prototype.loadAction = function(collectionClassName, app) {
    var self = this;
    var wrapper = document.getElementsByClassName(collectionClassName)[0];
    if (wrapper !== undefined) {
      var lastItem = wrapper.childNodes[wrapper.childNodes.length - 1];

      if (self.isElementInViewport(lastItem) && lastItem.dataset.isLastItem === undefined) {
        lastItem.dataset.isLastItem = true;
        self.partialOffSet += 1;
        var finalOffset = self.partialOffSet * 10;
        self.lastItem('currentUser', finalOffset, app);
      }
    }
  }

  window.InfiniteScroll = InfiniteScroll;

})(window);
