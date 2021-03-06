// Generated by CoffeeScript 1.9.3
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App.BankWithdrawalsCollection = (function(superClass) {
    extend(BankWithdrawalsCollection, superClass);

    function BankWithdrawalsCollection() {
      return BankWithdrawalsCollection.__super__.constructor.apply(this, arguments);
    }

    BankWithdrawalsCollection.prototype.type = null;

    BankWithdrawalsCollection.prototype.walletId = null;

    BankWithdrawalsCollection.prototype.url = function() {
      var params, url;
      url = "/bank-withdrawals";
      params = {};
      if (this.status) {
        params.status = this.status;
      }
      if (this.type) {
        params.type = this.type;
      }
      url += "?" + ($.param(params));
      return url;
    };

    BankWithdrawalsCollection.prototype.model = window.App.BankWithdrawalModel;

    BankWithdrawalsCollection.prototype.initialize = function(models, options) {
      if (options == null) {
        options = {};
      }
      this.type = options.type;
      this.walletId = options.walletId;
      return this.status = options.status;
    };

    return BankWithdrawalsCollection;

  })(Backbone.Collection);

}).call(this);
