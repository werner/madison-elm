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
        var dataObject = {};
        dataObject[key] = storageObject[key];
        self.getStorageType(isLocalStorage).setItem('madisonERP', JSON.stringify(dataObject));
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
    var data    = sessionStorage.getItem('madisonERP') || localStorage.getItem('madisonERP');
    var rawItem = JSON.parse(data);
    if (rawItem !== null) {
      var item = rawItem[storageKey];

      return item;
    } else {
      return null;
    }
  }

  Storage.prototype.getStorageType = function(isLocalStorage) {
    return isLocalStorage ? localStorage : sessionStorage;
  };

  window.Storage = Storage;

})(window);
