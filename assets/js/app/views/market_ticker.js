// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.MarketTickerView = (function(superClass) {
    extend(MarketTickerView, superClass);

    function MarketTickerView() {
      this.onMarketStatsUpdated = bind(this.onMarketStatsUpdated, this);
      return MarketTickerView.__super__.constructor.apply(this, arguments);
    }

    MarketTickerView.prototype.model = null;

    MarketTickerView.prototype.tpl = "market-ticker-tpl";

    MarketTickerView.prototype.activeCurrency = null;

    MarketTickerView.prototype.initialize = function(options) {
      if (options == null) {
        options = {};
      }
      return $.subscribe("market-stats-updated", this.onMarketStatsUpdated);
    };

    MarketTickerView.prototype.render = function() {
      return this.model.fetch({
        success: (function(_this) {
          return function() {
            return _this.renderMarketTicker();
          };
        })(this),
        error: (function(_this) {
          return function() {};
        })(this)
      });
    };

    MarketTickerView.prototype.renderMarketTicker = function() {
      this.$el.html(this.template({
        marketStats: this.model
      }));
      return this.markActive();
    };

    MarketTickerView.prototype.markActive = function(currency) {
      if (currency == null) {
        currency = null;
      }
      if (currency) {
        this.activeCurrency = currency;
      }
      return this.$("[data-market-currency='" + this.activeCurrency + "']").addClass("active");
    };

    MarketTickerView.prototype.onMarketStatsUpdated = function(ev, data) {
      return this.render();
    };

    return MarketTickerView;

  })(App.MasterView);

}).call(this);