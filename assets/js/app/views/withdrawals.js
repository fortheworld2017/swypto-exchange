// Generated by CoffeeScript 1.10.0
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.WithdrawalsView = (function(superClass) {
    extend(WithdrawalsView, superClass);

    function WithdrawalsView() {
      this.onWalletBalanceChanged = bind(this.onWalletBalanceChanged, this);
      this.onWalletBalanceLoaded = bind(this.onWalletBalanceLoaded, this);
      this.onPaymentProcessed = bind(this.onPaymentProcessed, this);
      return WithdrawalsView.__super__.constructor.apply(this, arguments);
    }

    WithdrawalsView.prototype.initialize = function(options) {
      $.subscribe("payment-processed", this.onPaymentProcessed);
      $.subscribe("wallet-balance-loaded", this.onWalletBalanceLoaded);
      return $.subscribe("wallet-balance-changed", this.onWalletBalanceChanged);
    };

    WithdrawalsView.prototype.renderWalletBalance = function(walletId) {
      var wallet;
      wallet = new App.WalletModel({
        id: walletId
      });
      return wallet.fetch({
        success: (function(_this) {
          return function() {
            _this.$("[data-wallet-balance-id='" + walletId + "']").html(_.str.toFixed(wallet.get("balance") + wallet.get("hold_balance")));
            _this.$("[data-wallet-hold-balance-id='" + walletId + "']").text(_.str.toFixed(wallet.get("hold_balance")));
            return _this.$("[data-wallet-available-balance-id='" + walletId + "']").text(_.str.toFixed(wallet.get("balance")));
          };
        })(this)
      });
    };

    WithdrawalsView.prototype.onAddWallet = function(ev) {
      var $form, wallet;
      ev.preventDefault();
      $form = $(ev.target);
      $form.find("button").attr("disabled", true);
      wallet = new App.WalletModel({
        currency: $form.find("#currency-type").val()
      });
      return wallet.save(null, {
        success: function() {
          return window.location.reload();
        },
        error: function(m, xhr) {
          $.publish("error", xhr);
          return $form.find("button").attr("disabled", false);
        }
      });
    };

    WithdrawalsView.prototype.onAvailableBalanceClick = function(ev) {
      var $target, amount;
      ev.preventDefault();
      $target = $(ev.target);
      amount = _.str.satoshiRound(App.math.add(parseFloat($target.text()), -parseFloat($target.data("withdrawal-fee"))));
      return $("#withdrawal-amount").val(amount);
    };

    WithdrawalsView.prototype.onPaymentProcessed = function(ev, payment) {
      return this.renderWalletBalance(payment.get("wallet_id"));
    };

    WithdrawalsView.prototype.onWalletBalanceLoaded = function(ev, wallet) {
      return this.renderWalletBalance(wallet.id);
    };

    WithdrawalsView.prototype.onWalletBalanceChanged = function(ev, wallet) {
      return this.renderWalletBalance(wallet.id);
    };

    return WithdrawalsView;

  })(App.MasterView);

}).call(this);
