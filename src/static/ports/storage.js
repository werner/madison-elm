(function(window){

  'use strict'

  function Storage(){};

  Storage.prototype.loadFromStorage = function(storageKey, app) {
    var item = sessionStorage.getItem(storageKey) || localStorage.getItem(storageKey);
    var fullItem = {};
    if (item === null) {
      app.ports.loadStorage.send('Nothing');
    } else {
      fullItem[storageKey] = JSON.parse(item);
      app.ports.loadStorage.send(JSON.stringify(fullItem));
    }
  };

  Storage.prototype.getStorageType = function(isLocalStorage) {
    return isLocalStorage ? localStorage : sessionStorage;
  };

  window.Storage = Storage;

})(window);
