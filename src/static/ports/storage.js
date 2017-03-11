(function(window){
  'use strict'

  function Storage(){};

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
