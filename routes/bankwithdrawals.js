(function() {
  var BankWithdrawal, JsonRenderer, MarketHelper, Wallet, _;

  BankWithdrawal = GLOBAL.db.BankWithdrawal;

  Wallet = GLOBAL.db.Wallet;

  MarketHelper = require("../lib/market_helper");

  JsonRenderer = require("../lib/json_renderer");

  _ = require("underscore");

  module.exports = function(app) {
    app.post("/bank-withdrawals", function(req, res) {
      var amount, data;
      amount = parseFloat(req.body.amount);
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      if (!_.isNumber(amount) || _.isNaN(amount) || !_.isFinite(amount)) {
        return JsonRenderer.error("Please submit a valid amount.", res);
      }
      data = {
        user_id: req.user.id,
        wallet_id: req.body.wallet_id,
        currency: req.body.wallet_id,
        status: MarketHelper.getBankWithdrawalStatus("pending"),
        type: MarketHelper.getBankWithdrawalType(req.body.type),
        remote_ip: req.connection.remoteAddress,
        amount: MarketHelper.toBigint(amount),
        address: req.body.address,
        email: req.body.email,
        name: req.body.name,
        iban: req.body.iban,
        bic_swift: req.body.bic_swift,
        postalcode: req.body.postalcode,
        city: req.body.city,
        country: req.body.country,
        bank_name: req.body.bank_name,
        bank_address: req.body.bank_address,
        bank_postalcode: req.body.bank_postalcode,
        bank_city: req.body.bank_city,
        bank_country: req.body.bank_country,
        bank_currency: req.body.bank_currency,
        label: req.body.label
      };
      return BankWithdrawal.submit(data, function(err, payment) {
        if (err) {
          return JsonRenderer.error(err, res);
        }
        return res.json(JsonRenderer.payment(payment));
      });
    });
    app.get("/bank-withdrawals/status/:status", function(req, res) {
      var status;
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      ({
        user_id: req.user.id
      });
      status = req.params.status;
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      return BankWithdrawal.findByUserAndStatus(req.user.id, status, function(err, payments) {
        if (err) {
          console.error(err);
        }
        if (err) {
          return JsonRenderer.error("Sorry, could not get pending payments...", res);
        }
        return res.json(JsonRenderer.payments(payments));
      });
    });
    return app.get("/bank-withdrawals", function(req, res) {
      var status, type, userId;
      status = req.query.status;
      userId = req.user.id;
      type = req.query.type;
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      return BankWithdrawal.findByTypeAndStatus(status, userId, type, function(err, withdrawals) {
        if (err) {
          console.error(err);
        }
        if (err) {
          return JsonRenderer.error("Sorry, could not get transactions...", res);
        }
        return res.json(JsonRenderer.bankWithdrawals(withdrawals));
      });
    });
  };

}).call(this);
