// Generated by CoffeeScript 1.9.3
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App || (window.App = {});

  App.OrderLogModel = (function(superClass) {
    extend(OrderLogModel, superClass);

    function OrderLogModel() {
      return OrderLogModel.__super__.constructor.apply(this, arguments);
    }

    OrderLogModel.prototype.urlRoot = "/order_logs";

    OrderLogModel.prototype.calculateFirstAmount = function() {
      if (this.get("action") === "buy") {
        return _.str.satoshiRound(this.get("result_amount"));
      }
      if (this.get("action") === "sell") {
        return _.str.satoshiRound(this.get("matched_amount"));
      }
    };

    OrderLogModel.prototype.calculateSecondAmount = function() {
      if (this.get("action") === "sell") {
        return _.str.satoshiRound(this.get("result_amount"));
      }
      if (this.get("action") === "buy") {
        return _.str.satoshiRound(App.math.multiply(this.get("matched_amount"), this.get("unit_price")));
      }
    };

    OrderLogModel.prototype.getTime = function() {
      return new Date(this.get('time')).format('dd.mm.yy H:MM');
    };

    return OrderLogModel;

  })(Backbone.Model);

}).call(this);
