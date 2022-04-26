(function() {
  var JsonRenderer, MarketHelper, Bank;

  Bank = GLOBAL.db.Bank;


  MarketHelper = require("../lib/market_helper");

  JsonRenderer = require("../lib/json_renderer");

  module.exports = function(app) {
    app.post("/bank", function(req, res) {
      newname = req.body.name
      newcountry = req.body.country
      newiban = req.body.iban
      newswift = req.body.swift
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      return Bank.findById(req.user.id, function(err,bank) {
      idfind = bank.id
        if (err) {
          console.error(err);
        }
      Bank.find({where:{id:idfind}}).complete(function (err, bank) {
        if(err){
          console.log(err);
        }
        if(bank){
          bank.updateAttributes({
          Name:newname,
          bankcountry:newcountry,
          IBAN:newiban,
          SWIFT:newswift
        }).success(function (data1) {
          console.log(data1);
          res.redirect('/settings/bank');
        })
       }
      });
    });
   });
    app.put("/bank/", function(req, res) {
      console.log(req.body.name);
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      return Bank.findById(req.user.id, function(err, bank) {
        if (err) {
          console.error(err);
        }
          res.redirect('/settings/preferences');
      });
    });
    app.get("/bank/:id", function(req, res) {
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
      return Bank.findById(req.user.id, function(err,bank) {
        if (err) {
          console.error(err);
        }
        return res.json(JsonRenderer.bank(bank));
      });
    });
    return app.get("/bank", function(req, res) {
      if (!req.user) {
        return JsonRenderer.error("Please auth.", res);
      }
        res.redirect('/settings/bank');
    });
  };

}).call(this);
