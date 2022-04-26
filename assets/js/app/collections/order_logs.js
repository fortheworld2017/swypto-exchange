// Generated by CoffeeScript 1.9.3
(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App.OrderLogsCollection = (function(superClass) {
    extend(OrderLogsCollection, superClass);

    function OrderLogsCollection() {
      return OrderLogsCollection.__super__.constructor.apply(this, arguments);
    }

    OrderLogsCollection.prototype.currency1 = null;

    OrderLogsCollection.prototype.currency2 = null;

    OrderLogsCollection.prototype.url = function() {
      var params, url;
      url = "/order_logs";
      params = {};
      if (this.action) {
        params.action = this.action;
      }
      if (this.currency1) {
        params.currency1 = this.currency1;
      }
      if (this.currency2) {
        params.currency2 = this.currency2;
      }
      if (this.userId) {
        params.user_id = this.userId;
      }
      if (this.orderBy) {
        params.sort_by = this.orderBy;
      }
      url += "?" + ($.param(params));
      return url;
    };

    OrderLogsCollection.prototype.model = window.App.OrderLogModel;

    OrderLogsCollection.prototype.initialize = function(models, options) {
      if (options == null) {
        options = {};
      }
      this.action = options.action;
      this.currency1 = options.currency1;
      this.currency2 = options.currency2;
      this.userId = options.userId;
      return this.orderBy = options.orderBy;
    };

    OrderLogsCollection.prototype.calculateVolume = function() {
      var total;
      total = 0;
      this.each(function(order) {
        return total = App.math.add(total, order.calculateFirstNoFeeAmount());
      });
      return _.str.satoshiRound(total);
    };

    OrderLogsCollection.prototype.calculateVolumeForPriceLimit = function(unitPrice) {
      var totalAmount;
      unitPrice = _.str.satoshiRound(unitPrice);
      totalAmount = 0;
      this.each(function(order) {
        var orderPrice;
        orderPrice = _.str.satoshiRound(order.get("unit_price"));
        if (orderPrice <= unitPrice) {
          totalAmount = App.math.add(totalAmount, order.calculateFirstNoFeeAmount());
        }
        if (orderPrice > unitPrice) {

        }
      });
      return _.str.satoshiRound(totalAmount);
    };

    return OrderLogsCollection;

  })(Backbone.Collection);

}).call(this);
