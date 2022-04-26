JsonRenderer = undefined
MarketHelper = undefined
Bank = GLOBAL.db.Bank
MarketHelper = require('../lib/market_helper')
JsonRenderer = require('../lib/json_renderer')

module.exports = (app) ->
  app.get "/bank/:id?", (req, res)->
    return JsonRenderer.error null, res, 401, false  if not req.user
    Bank.findById req.user.id, (err, bank) ->
      if err
        console.error err
      if bank
        return res.json JsonRenderer.bank bank
      if not bank
        return JsonRenderer.error null, res, 200, false

  app.post '/bank', (req, res) ->
    newname = req.body.name
    newBankname = req.body.bank_name
    newBankAddress = req.body.bank_address
    newBankCity = req.body.bank_city
    newBankPostCode = req.body.bank_post_code
    newcountry = req.body.country
    newiban = req.body.iban
    newswift = req.body.swift
    newPreferredCurrency = req.body.preferred_currency
    if !req.user
      return JsonRenderer.error('Please auth.', res)
    Bank.findById req.user.id, (err, bank) ->
      if err
        return JsonRenderer.error err, res  if err
      if not bank
        Bank.createNewBank {
          id: req.user.id
          Name: newname
          bankCountry: newcountry
          BankName:newBankname
          BankAddress:newBankAddress
          bankPostalCode: newBankPostCode
          bankCity: newBankCity
          preferredCurrency: newPreferredCurrency
          IBAN: newiban
          SWIFT: newswift} ,(err, bank)->
            if err
              return JsonRenderer.error err, res  if errconsole.log err
            res.json JsonRenderer.bank bank

#      Bank.find(where: id: idfind).complete (err, bank) ->
#        if err
#          console.log err
#
#        return
#      return
  app.put '/bank/:id', (req, res) ->
    if !req.user
      return JsonRenderer.error('Please auth.', res)
    Bank.findById req.user.id, (err, bank) ->
      if err
        console.error err
      if bank
        bank.updateAttributes req.body, (err, bank)->
          console.log err if err
          return JsonRenderer.error err, res  if err
          return res.json JsonRenderer.bank bank
#      res.redirect '/settings/preferences'
#      return
  app.get '/bank/:id', (req, res) ->
    if !req.user
      return JsonRenderer.error('Please auth.', res)
    bank.findById req.user.id, (err, bank) ->
      if err
        console.error err
      res.json JsonRenderer.bank(bank)
#  app.get '/bank', (req, res) ->
#    if !req.user
#      return JsonRenderer.error('Please auth.', res)
#    res.redirect '/settings/bank'
#    return