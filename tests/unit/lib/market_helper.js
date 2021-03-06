// Generated by CoffeeScript 1.9.3
(function() {
  var MarketHelper, speakeasy;

  require("./../../helpers/spec_helper");

  speakeasy = require("speakeasy");

  MarketHelper = require("./../../../lib/market_helper");

  describe("MarketHelper", function() {
    var AVAILABLE_MARKETS, CURRENCIES, CURRENCY_NAMES, DEFAULT_WITHDRAWAL_FEE, FEE, MARKET_STATUS, ORDER_ACTIONS, ORDER_STATUS, ORDER_TYPES, PAYMENT_STATUS, TOKENS, TRANSACTION_ACCEPTED_CATEGORIES, WITHDRAWAL_FEES;
    FEE = 0;
    CURRENCIES = {
      BTC: 1,
      LTC: 2,
      PPC: 3,
      DOGE: 4,
      NMC: 5,
      DRK: 6,
      XPM: 7,
      BC: 8,
      VTC: 9,
      METH: 10,
      NLG: 11,
      TCO: 12,
      CX: 13,
      BANK: 14,
      BRM: 15,
      GAY: 16,
      MAX: 17,
      ACC: 18,
      VIO: 19,
      VRC: 20,
      IDC: 21,
      GRC: 22,
      DIS: 23,
      CAIX: 24,
      SHARE: 25,
      LGC: 26,
      CFC: 27,
      RDD: 28,
      H5C: 29,
      RATC: 30,
      MAGIC: 31,
      SCOT: 32,
      UTC: 33,
      DIEM: 34,
      LIM: 35,
      NAUT: 36,
      CFN: 37,
      CURE: 38,
      GOOD: 39,
      QRK: 40,
      AAA: 41,
      MAST: 42,
      XC: 43,
      BOST: 44,
      FRK: 45,
      MUGA: 46,
      GLC: 47,
      DON: 48,
      PEV: 49,
      FRC: 50,
      UNO: 51,
      WDC: 52,
      FTC: 53,
      CSC: 54,
      TAC: 55,
      ZET: 56,
      AUR: 57,
      XLB: 58,
      CLOAK: 59,
      SWC: 60
    };
    CURRENCY_NAMES = {
      BTC: "Bitcoin",
      LTC: "Litecoin",
      PPC: "Peercoin",
      DOGE: "Dogecoin",
      NMC: "Namecoin",
      DRK: "Darkcoin",
      XPM: "Primecoin",
      BC: "Blackcoin",
      VTC: "Vertcoin",
      METH: "Cryptometh",
      NLG: "Guldencoin",
      TCO: "Tacocoin",
      CX: "Xtracoin",
      BANK: "Bankcoin",
      BRM: "Bitraam",
      GAY: "Homocoin",
      MAX: "Maxcoin",
      ACC: "Antarcticcoin",
      VIO: "Violincoin",
      VRC: "Vericoin",
      IDC: "Indocoin",
      GRC: "Gridcoin",
      DIS: "Distrocoin",
      CAIX: "CAIx",
      SHARE: "Sharecoin",
      LGC: "Logicoin",
      CFC: "Coffeecoin",
      RDD: "Reddcoin",
      H5C: "Highfivecoin",
      RATC: "Ratcoin",
      MAGIC: "Magicoin",
      SCOT: "Scotcoin",
      UTC: "Ultracoin",
      DIEM: "Carpediemcoin",
      LIM: "Limecoin",
      NAUT: "Nautiluscoin",
      CFN: "Confessioncoin",
      CURE: "Curecoin",
      GOOD: "Goodcoin",
      QRK: "Quarkcoin",
      AAA: "Coinaaa",
      MAST: "Mastiffcoin",
      XC: "X11Coin",
      BOST: "Boostcoin",
      FRK: "Frankocoin",
      MUGA: "Mugatucoin",
      GLC: "Gameleaguecoin",
      DON: "Donationcoin",
      PEV: "Plusevcoin",
      FRC: "Freicoin",
      UNO: "Unobtanium",
      WDC: "Worldcoin",
      FTC: "Feathercoin",
      CSC: "Casinocoin",
      TAC: "Talkcoin",
      ZET: "Zetacoin",
      AUR: "Auroracoin",
      XLB: "Libertycoin",
      CLOAK: "Cloakcoin",
      SWC: "Switzerlandcoin"
    };
    AVAILABLE_MARKETS = {
      LTC_BTC: 1,
      PPC_BTC: 2,
      DOGE_BTC: 3,
      NMC_BTC: 4,
      DRK_BTC: 5,
      XPM_BTC: 6,
      BC_BTC: 7,
      VTC_BTC: 8,
      METH_BTC: 9,
      NLG_BTC: 10,
      TCO_BTC: 11,
      CX_BTC: 12,
      BANK_BTC: 13,
      BRM_BTC: 14,
      GAY_BTC: 15,
      MAX_BTC: 16,
      ACC_BTC: 17,
      VIO_BTC: 18,
      VRC_BTC: 19,
      IDC_BTC: 20,
      GRC_BTC: 21,
      DIS_BTC: 22,
      CAIX_BTC: 23,
      SHARE_BTC: 24,
      LGC_BTC: 25,
      CFC_BTC: 26,
      RDD_BTC: 27,
      H5C_BTC: 28,
      RATC_BTC: 29,
      MAGIC_BTC: 30,
      SCOT_BTC: 31,
      UTC_BTC: 32,
      DIEM_BTC: 33,
      LIM_BTC: 34,
      NAUT_BTC: 35,
      CFN_BTC: 36,
      CURE_BTC: 37,
      GOOD_BTC: 38,
      QRK_BTC: 39,
      AAA_BTC: 40,
      MAST_BTC: 41,
      XC_BTC: 42,
      BOST_BTC: 43,
      FRK_BTC: 44,
      MUGA_BTC: 45,
      GLC_BTC: 46,
      DON_BTC: 47,
      PEV_BTC: 48,
      FRC_BTC: 49,
      UNO_BTC: 50,
      WDC_BTC: 51,
      FTC_BTC: 52,
      CSC_BTC: 53,
      TAC_BTC: 54,
      ZET_BTC: 55,
      AUR_BTC: 56,
      XLB_BTC: 57,
      CLOAK_BTC: 58,
      SWC_BTC: 59
    };
    ORDER_TYPES = {
      market: 1,
      limit: 2
    };
    ORDER_ACTIONS = {
      buy: 1,
      sell: 2
    };
    ORDER_STATUS = {
      open: 1,
      partiallyCompleted: 2,
      completed: 3
    };
    PAYMENT_STATUS = {
      pending: 1,
      processed: 2,
      canceled: 3
    };
    TRANSACTION_ACCEPTED_CATEGORIES = {
      send: 1,
      receive: 2
    };
    WITHDRAWAL_FEES = {
      BTC: 20000,
      LTC: 200000,
      PPC: 2000000,
      DOGE: 100000000,
      NMC: 10000000,
      DRK: 200000,
      XPM: 10000000,
      BC: 20000000,
      VTC: 2000000,
      METH: 20000000,
      NLG: 20000000,
      TCO: 20000000,
      CX: 20000000,
      BANK: 20000000,
      BRM: 200000,
      GAY: 2000000,
      MAX: 2000000,
      ACC: 20000000,
      VIO: 20000000,
      VRC: 20000,
      IDC: 20000000,
      GRC: 20000000,
      DIS: 20000000,
      CAIX: 20000000,
      SHARE: 20000000,
      LGC: 2000000,
      CFC: 20000000,
      RDD: 200000,
      H5C: 20000000,
      RATC: 20000000,
      MAGIC: 6000000,
      SCOT: 300000,
      UTC: 2000000,
      DIEM: 2000000,
      LIM: 20000000,
      NAUT: 20000
    };
    DEFAULT_WITHDRAWAL_FEE = 200000;
    TOKENS = {
      email_confirmation: 1,
      google_auth: 2,
      change_password: 3
    };
    MARKET_STATUS = {
      enabled: 1,
      disabled: 2
    };
    describe("getMarkets", function() {
      return it("returns the available markets list", function() {
        return JSON.stringify(MarketHelper.getMarkets()).should.equal(JSON.stringify(AVAILABLE_MARKETS));
      });
    });
    describe("getMarket", function() {
      return it("returns the market id based on its type", function() {
        var market, marketId, results;
        results = [];
        for (market in AVAILABLE_MARKETS) {
          marketId = AVAILABLE_MARKETS[market];
          results.push(MarketHelper.getMarket(market).should.equal(marketId));
        }
        return results;
      });
    });
    describe("getMarketTypes", function() {
      return it("returns the names of the available markets", function() {
        return JSON.stringify(MarketHelper.getMarketTypes()).should.equal(JSON.stringify(Object.keys(AVAILABLE_MARKETS)));
      });
    });
    describe("getMarketLiteral", function() {
      return it("returns the market name based on its id", function() {
        var market, marketId, results;
        results = [];
        for (market in AVAILABLE_MARKETS) {
          marketId = AVAILABLE_MARKETS[market];
          results.push(MarketHelper.getMarketLiteral(marketId).should.equal(market));
        }
        return results;
      });
    });
    describe("isValidMarket", function() {
      it("returns true if a market for for sell given currencies exists", function() {
        var buyCurrency, i, len, market, ref, results, sellCurrency;
        ref = ["LTC", "PPC", "DOGE"];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          buyCurrency = ref[i];
          results.push((function() {
            var j, len1, ref1, results1;
            ref1 = ["BTC"];
            results1 = [];
            for (j = 0, len1 = ref1.length; j < len1; j++) {
              sellCurrency = ref1[j];
              market = buyCurrency + "_" + sellCurrency;
              results1.push(MarketHelper.isValidMarket("buy", buyCurrency, sellCurrency).should.be["true"]);
            }
            return results1;
          })());
        }
        return results;
      });
      it("returns true if a market for sell given currencies exists", function() {
        var buyCurrency, i, len, market, ref, results, sellCurrency;
        ref = ["BTC"];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          buyCurrency = ref[i];
          results.push((function() {
            var j, len1, ref1, results1;
            ref1 = ["LTC", "PPC", "DOGE"];
            results1 = [];
            for (j = 0, len1 = ref1.length; j < len1; j++) {
              sellCurrency = ref1[j];
              market = sellCurrency + "_" + buyCurrency;
              results1.push(MarketHelper.isValidMarket("sell", buyCurrency, sellCurrency).should.be["true"]);
            }
            return results1;
          })());
        }
        return results;
      });
      it("returns false for an invalid action", function() {
        MarketHelper.isValidMarket("hello", "LTC", "BTC").should.be["false"];
        return MarketHelper.isValidMarket("hello", "BTC", "LTC").should.be["false"];
      });
      return it("returns false for a same currency pair", function() {
        MarketHelper.isValidMarket("buy", "BTC", "BTC").should.be["false"];
        return MarketHelper.isValidMarket("sell", "BTC", "BTC").should.be["false"];
      });
    });
    describe("getOrderStatus", function() {
      return it("returns the order status id for the given status", function() {
        var results, status, statusId;
        results = [];
        for (status in ORDER_STATUS) {
          statusId = ORDER_STATUS[status];
          results.push(MarketHelper.getOrderStatus(status).should.equal(statusId));
        }
        return results;
      });
    });
    describe("getOrderStatusLiteral", function() {
      return it("returns the order status for the given status id", function() {
        var results, status, statusId;
        results = [];
        for (status in ORDER_STATUS) {
          statusId = ORDER_STATUS[status];
          results.push(MarketHelper.getOrderStatusLiteral(statusId).should.equal(status));
        }
        return results;
      });
    });
    describe("getOrderAction", function() {
      return it("returns the order action id for the given action", function() {
        var action, actionId, results;
        results = [];
        for (action in ORDER_ACTIONS) {
          actionId = ORDER_ACTIONS[action];
          results.push(MarketHelper.getOrderAction(action).should.equal(actionId));
        }
        return results;
      });
    });
    describe("getOrderActionLiteral", function() {
      return it("returns the order action for the given action id", function() {
        var action, actionId, results;
        results = [];
        for (action in ORDER_ACTIONS) {
          actionId = ORDER_ACTIONS[action];
          results.push(MarketHelper.getOrderActionLiteral(actionId).should.equal(action));
        }
        return results;
      });
    });
    describe("getOrderType", function() {
      return it("returns the order type id for the given type", function() {
        var results, type, typeId;
        results = [];
        for (type in ORDER_TYPES) {
          typeId = ORDER_TYPES[type];
          results.push(MarketHelper.getOrderType(type).should.equal(typeId));
        }
        return results;
      });
    });
    describe("getOrderTypeLiteral", function() {
      return it("returns the order type for the given type id", function() {
        var results, type, typeId;
        results = [];
        for (type in ORDER_TYPES) {
          typeId = ORDER_TYPES[type];
          results.push(MarketHelper.getOrderTypeLiteral(typeId).should.equal(type));
        }
        return results;
      });
    });
    describe("getCurrencies", function() {
      return it("returns the available currencies list", function() {
        return JSON.stringify(MarketHelper.getCurrencies()).should.equal(JSON.stringify(CURRENCIES));
      });
    });
    describe("getCurrencyTypes", function() {
      return it("returns the names of the available currencies", function() {
        return JSON.stringify(MarketHelper.getCurrencyTypes()).should.equal(JSON.stringify(Object.keys(CURRENCIES)));
      });
    });
    describe("getCurrency", function() {
      return it("returns the currency id based on its type", function() {
        var currency, currencyId, results;
        results = [];
        for (currency in CURRENCIES) {
          currencyId = CURRENCIES[currency];
          results.push(MarketHelper.getCurrency(currency).should.equal(currencyId));
        }
        return results;
      });
    });
    describe("getCurrencyLiteral", function() {
      return it("returns the currency type for the given currency id", function() {
        var currency, currencyId, results;
        results = [];
        for (currency in CURRENCIES) {
          currencyId = CURRENCIES[currency];
          results.push(MarketHelper.getCurrencyLiteral(currencyId).should.equal(currency));
        }
        return results;
      });
    });
    describe("getCurrencyNames", function() {
      return it("returns the names of the currencies", function() {
        return JSON.stringify(MarketHelper.getCurrencyNames()).should.equal(JSON.stringify(CURRENCY_NAMES));
      });
    });
    describe("getCurrencyName", function() {
      return it("returns the currency id based on its name", function() {
        var currency, currencyName, results;
        results = [];
        for (currency in CURRENCY_NAMES) {
          currencyName = CURRENCY_NAMES[currency];
          results.push(MarketHelper.getCurrencyName(currency).should.equal(currencyName));
        }
        return results;
      });
    });
    describe("isValidCurrency", function() {
      it("returns true if a currency is valid", function() {
        var currency, i, len, ref, results;
        ref = Object.keys(CURRENCIES);
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          currency = ref[i];
          results.push(MarketHelper.isValidCurrency(currency).should.be["true"]);
        }
        return results;
      });
      return it("returns false for an invalid currency", function() {
        return MarketHelper.isValidCurrency("HELLO").should.be["false"];
      });
    });
    describe("getPaymentStatus", function() {
      return it("returns the payment status id for the given status", function() {
        var results, status, statusId;
        results = [];
        for (status in PAYMENT_STATUS) {
          statusId = PAYMENT_STATUS[status];
          results.push(MarketHelper.getPaymentStatus(status).should.equal(statusId));
        }
        return results;
      });
    });
    describe("getPaymentStatusLiteral", function() {
      return it("returns the payment status for the given status id", function() {
        var results, status, statusId;
        results = [];
        for (status in PAYMENT_STATUS) {
          statusId = PAYMENT_STATUS[status];
          results.push(MarketHelper.getPaymentStatusLiteral(statusId).should.equal(status));
        }
        return results;
      });
    });
    describe("getTransactionCategory", function() {
      return it("returns the id for the given category", function() {
        var category, categoryId, results;
        results = [];
        for (category in TRANSACTION_ACCEPTED_CATEGORIES) {
          categoryId = TRANSACTION_ACCEPTED_CATEGORIES[category];
          results.push(MarketHelper.getTransactionCategory(category).should.equal(categoryId));
        }
        return results;
      });
    });
    describe("getTransactionCategoryLiteral", function() {
      return it("returns the category for the given id", function() {
        var category, categoryId, results;
        results = [];
        for (category in TRANSACTION_ACCEPTED_CATEGORIES) {
          categoryId = TRANSACTION_ACCEPTED_CATEGORIES[category];
          results.push(MarketHelper.getTransactionCategoryLiteral(categoryId).should.equal(category));
        }
        return results;
      });
    });
    describe("toBigint", function() {
      return it("converts a float to a bigint by multiplying with 10^8", function() {
        MarketHelper.toBigint(0.00000001).should.equal(1);
        MarketHelper.toBigint(0.0000001).should.equal(10);
        return MarketHelper.toBigint(1).should.equal(100000000);
      });
    });
    describe("fromBigint", function() {
      return it("converts a bigint to float by dividing it with 10^8", function() {
        MarketHelper.fromBigint(0.1).should.equal(0.000000001);
        MarketHelper.fromBigint(1).should.equal(0.00000001);
        MarketHelper.fromBigint(10).should.equal(0.0000001);
        return MarketHelper.fromBigint(100000000).should.equal(1);
      });
    });
    describe("getTokenType", function() {
      return it("returns the token id for the given token", function() {
        var results, token, tokenId;
        results = [];
        for (token in TOKENS) {
          tokenId = TOKENS[token];
          results.push(MarketHelper.getTokenType(token).should.equal(tokenId));
        }
        return results;
      });
    });
    describe("getTokenTypeLiteral", function() {
      return it("returns the token for the given id", function() {
        var results, token, tokenId;
        results = [];
        for (token in TOKENS) {
          tokenId = TOKENS[token];
          results.push(MarketHelper.getTokenTypeLiteral(tokenId).should.equal(token));
        }
        return results;
      });
    });
    describe("getMarketStatus", function() {
      return it("returns the status id for the given market status", function() {
        var results, status, statusId;
        results = [];
        for (status in MARKET_STATUS) {
          statusId = MARKET_STATUS[status];
          results.push(MarketHelper.getMarketStatus(status).should.equal(statusId));
        }
        return results;
      });
    });
    describe("getMarketStatusLiteral", function() {
      return it("returns the market status for the given id", function() {
        var results, status, statusId;
        results = [];
        for (status in MARKET_STATUS) {
          statusId = MARKET_STATUS[status];
          results.push(MarketHelper.getMarketStatusLiteral(statusId).should.equal(status));
        }
        return results;
      });
    });
    describe("getTradeFee", function() {
      return it("returns the correct trade fee", function() {
        return MarketHelper.getTradeFee().should.equal(FEE);
      });
    });
    describe("getMinTradeAmount", function() {
      return it("returns the minimum trade amount", function() {
        return MarketHelper.getMinTradeAmount().should.equal(10);
      });
    });
    describe("getMinSpendAmount", function() {
      return it("returns the minimum spend amount", function() {
        return MarketHelper.getMinSpendAmount().should.equal(10000);
      });
    });
    describe("getMinReceiveAmount", function() {
      return it("returns the minimum receive amount", function() {
        return MarketHelper.getMinReceiveAmount().should.equal(10000);
      });
    });
    describe("getMinFeeAmount", function() {
      return it("returns the minimum fee amount", function() {
        return MarketHelper.getMinFeeAmount().should.equal(1);
      });
    });
    describe("getMinConfirmations", function() {
      describe("when the given currency is BTC", function() {
        return it("returns 3", function() {
          return MarketHelper.getMinConfirmations("BTC").should.equal(3);
        });
      });
      return describe("when the given currency is not BTC", function() {
        return it("returns 6", function() {
          return MarketHelper.getMinConfirmations("NMC").should.equal(6);
        });
      });
    });
    describe("calculateResultAmount", function() {
      it("returns the amount for buy", function() {
        return MarketHelper.calculateResultAmount(1000, "buy", MarketHelper.toBigint(0.1)).should.equal(1000);
      });
      return it("returns the amount times unitPrice for sell", function() {
        return MarketHelper.calculateResultAmount(1000, "sell", MarketHelper.toBigint(0.1)).should.equal(100);
      });
    });
    describe("calculateFee", function() {
      return it("calculates the fee amount based on the fee in % ", function() {
        return MarketHelper.calculateFee(5 * 100).should.equal(FEE * 5);
      });
    });
    describe("calculateSpendAmount", function() {
      it("returns the amount for sell", function() {
        return MarketHelper.calculateSpendAmount(1000, "sell", MarketHelper.toBigint(0.1)).should.equal(1000);
      });
      return it("returns the amount times unitPrice for buy", function() {
        return MarketHelper.calculateSpendAmount(1000, "buy", MarketHelper.toBigint(0.1)).should.equal(100);
      });
    });
    return describe("getWithdrawalFee", function() {
      return it("returns the withdrawal fee per currency", function() {
        var currency, results;
        results = [];
        for (currency in CURRENCIES) {
          if (WITHDRAWAL_FEES[currency] != null) {
            results.push(MarketHelper.getWithdrawalFee(currency).should.equal(WITHDRAWAL_FEES[currency]));
          } else {
            results.push(MarketHelper.getWithdrawalFee(currency).should.equal(DEFAULT_WITHDRAWAL_FEE));
          }
        }
        return results;
      });
    });
  });

}).call(this);
