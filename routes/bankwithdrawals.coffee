BankWithdrawal = GLOBAL.db.BankWithdrawal
Wallet = GLOBAL.db.Wallet
MarketHelper = require "../lib/market_helper"
JsonRenderer = require "../lib/json_renderer"
_ = require "underscore"

module.exports = (app)->

  app.post "/bank-withdrawals", (req, res)->
    amount = parseFloat req.body.amount
    return JsonRenderer.error "Please auth.", res  if not req.user
    return JsonRenderer.error "Please submit a valid amount.", res  if not _.isNumber(amount) or _.isNaN(amount) or not _.isFinite(amount)

    data =
      user_id: req.user.id
      wallet_id: req.body.wallet_id
      currency: req.body.wallet_id
      status: MarketHelper.getBankWithdrawalStatus("pending")
      type: MarketHelper.getBankWithdrawalType req.body.type
      remote_ip: req.connection.remoteAddress
      amount: MarketHelper.toBigint amount
      address: req.body.address
      email: req.body.email
      name: req.body.name
      iban: req.body.iban
      bic_swift: req.body.bic_swift
      postalcode: req.body.postalcode
      city: req.body.city
      country: req.body.country
      bank_name: req.body.bank_name
      bank_address: req.body.bank_address
      bank_postalcode: req.body.bank_postalcode
      bank_city: req.body.bank_city
      bank_country: req.body.bank_country
      bank_currency: req.body.bank_currency
      label: req.body.label
    BankWithdrawal.submit data, (err, payment)->
      return JsonRenderer.error err, res  if err
      res.json JsonRenderer.payment payment

#  app.get "/bank-withdrawals/pending/:wallet_id", (req, res)->
#    walletId = req.params.wallet_id
#    return JsonRenderer.error "Please auth.", res  if not req.user
#    BankWithdrawal.findByUserAndWallet req.user.id, walletId, "pending", (err, payments)->
#      console.error err  if err
#      return JsonRenderer.error "Sorry, could not get pending payments...", res  if err
#      res.json JsonRenderer.payments payments

#  @todo remove this Temp path for testing
  app.get "/bank-withdrawals/status/:status", (req, res)->
    return JsonRenderer.error "Please auth.", res  if not req.user
    user_id: req.user.id
    status = req.params.status
    return JsonRenderer.error "Please auth.", res  if not req.user
    BankWithdrawal.findByUserAndStatus req.user.id, status, (err, payments)->
      console.error err  if err
      return JsonRenderer.error "Sorry, could not get pending payments...", res  if err
      res.json JsonRenderer.payments payments

  app.get "/bank-withdrawals", (req, res)->
    status = req.query.status
    userId = req.user.id
    type = req.query.type
    return JsonRenderer.error "Please auth.", res  if not req.user
    BankWithdrawal.findByTypeAndStatus status,userId,type,(err, withdrawals)->
      console.error err  if err
      return JsonRenderer.error "Sorry, could not get transactions...", res  if err
      res.json JsonRenderer.bankWithdrawals withdrawals
