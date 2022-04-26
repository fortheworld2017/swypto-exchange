// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.PaymentHistoryView = (function(superClass) {
    extend(PaymentHistoryView, superClass);

    function PaymentHistoryView() {
      this.onPaymentProcessed = bind(this.onPaymentProcessed, this);
      this.onTransactionUpdate = bind(this.onTransactionUpdate, this);
      return PaymentHistoryView.__super__.constructor.apply(this, arguments);
    }

    PaymentHistoryView.prototype.tpl = "payment-history-tpl";

    PaymentHistoryView.prototype.collection = null;

    PaymentHistoryView.prototype.initialize = function(options) {
      if (options == null) {
        options = {};
      }
      if (options.hideOnEmpty) {
        this.hideOnEmpty = options.hideOnEmpty;
      }
      $.subscribe("payment-processed", this.onPaymentProcessed);
      return $.subscribe("transaction-update", this.onTransactionUpdate);
    };

    PaymentHistoryView.prototype.render = function() {
      return this.collection.fetch({
        success: (function(_this) {
          return function() {
            _this.renderPayments();
            if (_this.hideOnEmpty) {
              return _this.toggleVisible();
            }
          };
        })(this)
      });
    };

    PaymentHistoryView.prototype.renderPayments = function() {
      return this.collection.each((function(_this) {
        return function(payment) {
          var $existentPayment, tpl;
          $existentPayment = _this.$("[data-id='" + payment.id + "']");
          tpl = _this.template({
            payment: payment
          });
          _this.$el.append(tpl);
          if ($existentPayment.length) {
            return $existentPayment.replaceWith(tpl);
          }
        };
      })(this));
    };

    PaymentHistoryView.prototype.onTransactionUpdate = function(ev, transaction) {
      return this.render();
    };

    PaymentHistoryView.prototype.onPaymentProcessed = function(ev, payment) {
      return this.render();
    };

    return PaymentHistoryView;

  })(App.MasterView);

}).call(this);
