// Generated by CoffeeScript 1.9.3
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App.WalletsCollection = (function(superClass) {
    extend(WalletsCollection, superClass);

    function WalletsCollection() {
      return WalletsCollection.__super__.constructor.apply(this, arguments);
    }

    WalletsCollection.prototype.url = "/wallets";

    WalletsCollection.prototype.model = window.App.WalletModel;

    return WalletsCollection;

  })(Backbone.Collection);

}).call(this);
