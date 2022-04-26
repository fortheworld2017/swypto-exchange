(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.BuyView = (function(superClass) {
    extend(BuyView, superClass);

    function BuyView() {
      //this.onOrderBookOrderSelected = bind(this.onOrderBookOrderSelected, this);
      //this.onWalletBalanceChanged = bind(this.onWalletBalanceChanged, this);
      //this.onWalletBalanceLoaded = bind(this.onWalletBalanceLoaded, this);
      //this.onPaymentProcessed = bind(this.onPaymentProcessed, this);
      //this.onMarketStatsUpdated = bind(this.onMarketStatsUpdated, this);
      return BuyView.__super__.constructor.apply(this, arguments);
    }

    BuyView.prototype.model = null;

    BuyView.prototype.tpl = "coin-stats-tpl";

    BuyView.prototype.currency1 = null;

    BuyView.prototype.currency2 = null;

    BuyView.prototype.events = {
      //"click .market-switcher": "onMarketSwitch",
      //"click .header-balance .amount": "onAmountClick",
      //"keyup #market-buy-form #spend-amount-input": "onMarketBuyAmountChange",
      "keyup #card-buy-form #card-buy-amount-input": "onCardBuyAmountChange"
      //"keyup #sell-amount-input": "onSellAmountChange",
      //"keyup #sell-unit-price": "onSellAmountChange"
    };

    BuyView.prototype.initialize = function(options) {
      if (options == null) {
        options = {};
      }
      this.currency1 = options.currency1;
      this.currency2 = options.currency2;
      $.subscribe("market-stats-updated", this.onMarketStatsUpdated);
      $.subscribe("payment-processed", this.onPaymentProcessed);
      $.subscribe("wallet-balance-loaded", this.onWalletBalanceLoaded);
      $.subscribe("wallet-balance-changed", this.onWalletBalanceChanged);
      return $.subscribe("order-book-order-selected", this.onOrderBookOrderSelected);
    };

    BuyView.prototype.render = function() {
      this.model.fetch({
        success: (function(_this) {
          return function() {
            return _this.renderTradeStats();
          };
        })(this),
        error: (function(_this) {
          return function() {};
        })(this)
      });
      return this.setupFormValidators();
    };

    BuyView.prototype.renderTradeStats = function() {
      var stats;
      stats = this.model.get(this.currency1 + "_" + this.currency2);
      return this.$("#coin-stats").html(this.template({
        coinStats: stats,
        currency1: this.currency1,
        currency2: this.currency2
      }));
    };

    BuyView.prototype.renderWalletBalance = function(walletId) {
      var wallet;
      wallet = new App.WalletModel({
        id: walletId
      });
      return wallet.fetch({
        success: (function(_this) {
          return function() {
            _this.$("[data-wallet-balance-id='" + walletId + "']").html(_.str.toFixed(_.str.satoshiRound(wallet.get("balance") + wallet.get("hold_balance"))));
            _this.$("[data-wallet-hold-balance-id='" + walletId + "']").text(_.str.toFixed(_.str.satoshiRound(wallet.get("hold_balance"))));
            return _this.$("[data-wallet-available-balance-id='" + walletId + "']").text(_.str.toFixed(_.str.satoshiRound(wallet.get("balance"))));
          };
        })(this)
      });
    };

    BuyView.prototype.setupFormValidators = function() {
      var i, len, orderForm, ref, results;
      ref = this.$(".order-form");
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        orderForm = ref[i];
        results.push($(orderForm).validate({
          rules: {
            amount: {
              required: true,
              number: true,
              min: 0.0000001
            },
            unit_price: {
              required: true,
              number: true,
              min: 0.00000001
            }
          },
          messages: {
            amount: {
              required: "Please provide an amount.",
              min: "Please provide an amount bigger than 0.0000001"
            },
            unit_price: {
              required: "Please provide an amount.",
              min: "Please provide an amount bigger than 0.000001"
            }
          },
          submitHandler: (function(_this) {
            return function(form) {
              _this.onOrderSubmit(form);
              return false;
            };
          })(this)
        }));
      }
      return results;
    };

    BuyView.prototype.isValidAmount = function(amount) {
      return _.isNumber(amount) && !_.isNaN(amount) && _.isFinite(amount) && amount > 0;
    };

    BuyView.prototype.onMarketSwitch = function(ev) {
      var $target;
      $target = $(ev.target);
      this.$("#limit-" + ($target.attr("name")) + "-box,#market-" + ($target.attr("name")) + "-box").hide();
      return this.$("#" + ($target.val()) + "-" + ($target.attr("name")) + "-box").show();
    };

    BuyView.prototype.onOrderSubmit = function(form) {
      var $form, amount, order;
      $form = $(form);
      $form.find("#error-cnt").empty();
      amount = _.str.satoshiRound($form.find("[name='amount']").val());
      order = new App.OrderModel({
        type: $form.find("[name='type']").val(),
        action: $form.find("[name='action']").val(),
        sell_currency: $form.find("[name='sell_currency']").val(),
        buy_currency: $form.find("[name='buy_currency']").val(),
        amount: amount,
        unit_price: $form.find("[name='unit_price']").val()
      });
      return order.save(null, {
        success: function() {
          $form.find("[name='amount']").val("");
          return window.location.reload(false);
        },
        error: function(m, xhr) {
          return $.publish("error", [xhr, $form]);
        }
      });
    };

    BuyView.prototype.onAmountClick = function(ev) {
      var $input, $target, amount, resultAmount, type, unitPrice;
      ev.preventDefault();
      $target = $(ev.currentTarget);
      amount = parseFloat($target.find("[data-wallet-available-balance-id]").text());
      type = $target.data('type');
      $input = this.$("#" + type + "-amount-input");
      unitPrice = _.str.satoshiRound(this.$("#" + type + "-unit-price").val());
      resultAmount = type === "buy" ? _.str.satoshiRound(App.math.divide(amount, unitPrice)) : amount;
      resultAmount = this.isValidAmount(resultAmount) ? resultAmount : 0;
      $input.val(_.str.toFixed(resultAmount));
      return $input.trigger("keyup");
    };

    BuyView.prototype.onCardBuyAmountChange = function(ev) {
      var $fee, $form, $result, $subTotal, $target, buyAmount, fee, lastPrice, subTotal, total, totalFee;
      $target = $(ev.target);
      $form = $target.parents("form");
      buyAmount = _.str.satoshiRound($form.find("#card-buy-amount-input").val());
      $buybutton = $form.find("#buy-button");
      $result = $form.find("#card-buy-amount-result");
      $fee = $form.find("#card-buy-fee");
      $subTotal = $form.find("#card-buy-subtotal");
      $f_amount = $form.find("#RESULT_TextField-13");
        
      fee = _.str.satoshiRound($fee.data("fee"));
      lastPrice = _.str.satoshiRound($form.find("#card-buy-unit-price").val());
      if (this.isValidAmount(buyAmount) && this.isValidAmount(lastPrice)) {
        subTotal = _.str.satoshiRound(App.math.multiply(buyAmount, lastPrice));
        totalFee = _.str.satoshiRound(App.math.select(subTotal).divide(100).multiply(7).done());
        total = _.str.satoshiRound(App.math.add(subTotal, totalFee));
        $fee.text(_.str.toFixed(totalFee));
        $subTotal.text(_.str.toFixed(subTotal));
        $buybutton.attr("disabled",false);
        $f_amount.val(total);
        return $result.text(_.str.toFixed(total));
      } else {
        $buybutton.attr("disabled",true);
        $result.text(0);
        $fee.text(0);
        $f_amount.val(0);
        return $subTotal.text(0);
      }
    };

    BuyView.prototype.onSellAmountChange = function(ev) {
      var $fee, $form, $result, $subTotal, $target, fee, lastPrice, sellAmount, subTotal, total, totalFee;
      $target = $(ev.target);
      $form = $target.parents("form");
      sellAmount = _.str.satoshiRound($form.find("#sell-amount-input").val());
      $result = $form.find("#sell-amount-result");
      $fee = $form.find("#sell-fee");
      $subTotal = $form.find("#sell-subtotal");
      fee = _.str.satoshiRound($fee.data("fee"));
      lastPrice = _.str.satoshiRound($form.find("#sell-unit-price").val());
      alert('y');
      if (this.isValidAmount(sellAmount) && this.isValidAmount(lastPrice)) {
        subTotal = _.str.satoshiRound(App.math.multiply(sellAmount, lastPrice));
        totalFee = _.str.satoshiRound(App.math.select(subTotal).divide(100).multiply(fee).done());
        total = _.str.satoshiRound(App.math.add(subTotal, -totalFee));
        $fee.text(totalFee);
        $subTotal.text(_.str.toFixed(subTotal));
        return $result.text(_.str.toFixed(total));
      } else {
        $result.text(0);
        $fee.text(0);
        return $subTotal.text(0);
      }
    };

    BuyView.prototype.onMarketStatsUpdated = function(ev, data) {
      return this.render();
    };

    BuyView.prototype.onPaymentProcessed = function(ev, payment) {
      return this.renderWalletBalance(payment.get("wallet_id"));
    };

    BuyView.prototype.onWalletBalanceLoaded = function(ev, wallet) {
      return this.renderWalletBalance(wallet.id);
    };

    BuyView.prototype.onWalletBalanceChanged = function(ev, wallet) {
      return this.renderWalletBalance(wallet.id);
    };

    BuyView.prototype.onOrderBookOrderSelected = function(ev, order) {
      this.$("#buy-unit-price,#sell-unit-price").val(_.str.toFixed(order.get("unit_price")));
      if (order.get("action") === "sell") {
        this.$("#buy-amount-input").val(_.str.toFixed(order.get("amount"))).trigger("keyup");
      }
      if (order.get("action") === "buy") {
        return this.$("#sell-amount-input").val(_.str.toFixed(order.get("amount"))).trigger("keyup");
      }
    };

    return BuyView;

  })(App.MasterView);

}).call(this);