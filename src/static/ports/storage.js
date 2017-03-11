(function(window){
  'use strict'

  function Storage(){};

  Storage.prototype.init = function(app) {
    var self = this;
  
    app.ports.doloadStorage.subscribe(function(storageKey) {
      self.loadFromStorage(storageKey, app);
    });

    app.ports.saveStorage.subscribe(function(args) {
      var [storageObject, isLocalStorage] = args;
      Object.keys(storageObject).forEach(function (key) {
        self.getStorageType(isLocalStorage).setItem(key, JSON.stringify(storageObject[key]));
      });
    });
  }

  Storage.prototype.loadFromStorage = function(storageKey, app) {
    var value = this.getValueFromStorage(storageKey);
    var fullItem = {};
    if (value === null) {
      app.ports.loadStorage.send('Nothing');
    } else {
      fullItem[storageKey] = value;
      app.ports.loadStorage.send(JSON.stringify(fullItem));
    }
  };

  Storage.prototype.getValueFromStorage = function(storageKey) {
    var item = sessionStorage.getItem(storageKey) || localStorage.getItem(storageKey);
    return JSON.parse(item);
  }

  Storage.prototype.getStorageType = function(isLocalStorage) {
    return isLocalStorage ? localStorage : sessionStorage;
  };

  window.Storage = Storage;

})(window);
