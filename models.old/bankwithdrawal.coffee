MarketHelper = require "../lib/market_helper"
ipFormatter = require "ip"
math = require "../lib/math"
Emailer   = require "../lib/emailer"
module.exports = (sequelize, DataTypes) ->
  BankWithdrawal = sequelize.define('BankWithdrawal', {
    name: DataTypes.STRING
    email: DataTypes.STRING
    currency:
      type: DataTypes.INTEGER.UNSIGNED
      get: ()->
        MarketHelper.getCurrencyLiteral @getDataValue("currency")
      set: (currency)->
        @setDataValue "currency", MarketHelper.getCurrency(currency)
    wallet_id: DataTypes.INTEGER.UNSIGNED
    user_id: DataTypes.INTEGER.UNSIGNED
    fraud: DataTypes.BOOLEAN
    remote_ip: DataTypes.STRING(16)
    amount: DataTypes.BIGINT(20)
    fee: DataTypes.BIGINT(20)
    iban: DataTypes.STRING
    bic_swift: DataTypes.STRING
    address: DataTypes.STRING
    postalcode: DataTypes.STRING
    city: DataTypes.STRING
    country: DataTypes.STRING
    comment: DataTypes.STRING
    bank_name: DataTypes.STRING
    bank_address: DataTypes.STRING
    bank_postalcode: DataTypes.STRING
    bank_city: DataTypes.STRING
    bank_country: DataTypes.STRING
    type: DataTypes.INTEGER(1)
    status: DataTypes.INTEGER(1)
    is_mail_sent: DataTypes.BOOLEAN
    bank_currency: DataTypes.STRING
  },
    tableName: 'bank_withdrawals'
    classMethods:
      findById: (id, callback)->
        BankWithdrawal.find(id).complete callback
      findByUserAndWallet: (userId, walletId, status, callback)->
        query =
          where:
            user_id: userId
            wallet_id: walletId
            status: MarketHelper.getPaymentStatus(status)
        BankWithdrawal.findAll(query).complete callback

    instanceMethods:
      getFloat: (attribute)->
        return @[attribute]  if not @[attribute]?
        MarketHelper.fromBigint @[attribute]
      isProcessed: ()->
        @status is "processed"

      isCanceled: ()->
        @status is "canceled"

      isPending: ()->
        @status is "pending"

      process: (response, callback = ()->)->
        @status = "2"
        @id = response
        @save().complete callback

      getTypeLiteral: ()->
        MarketHelper.getBankWithdrawalTypeLiteralForExport @type
    classMethods:
      findById: (id, callback)->
        BankWithdrawal.find(id).complete callback

      findByIdWithUserDetails: (id, callback)->
        query =
          where:
            id: id
          order: [
            ["created_at", "ASC"]
          ]
          include: [
            {model: GLOBAL.db.User, attributes: ["username", "email"]}
          ]
        BankWithdrawal.findAll(query).complete callback

      findByTypeAndStatus: (status,userId,type,callback)->
        query =
          where:
            user_id: userId
            status: MarketHelper.getBankWithdrawalStatus(status)
          order: [
            ["created_at", "ASC"]
          ]
        if type != 'All'
          query.where.type = MarketHelper.getBankWithdrawalType(type)
        BankWithdrawal.findAll(query).complete callback


      findNonProcessedById: (id, callback)->
        BankWithdrawal.find({where: {id: id, status: MarketHelper.getBankWithdrawalStatus("pending")}}).complete callback

      findByUserAndWallet: (userId, walletId, status, callback)->
        query =
          where:
            user_id: userId
            wallet_id: walletId
            status: MarketHelper.getBankWithdrawalStatus(status)
        BankWithdrawal.findAll(query).complete callback
      findToProcess: (callback)->
        query =
          where:
            status: MarketHelper.getBankWithdrawalStatus "processed"
#            user_id: req.user.id
          order: [
            ["created_at", "ASC"]
          ]
        BankWithdrawal.findAll(query).complete callback

      findByUserAndStatus: (userId, status, callback)->
        query =
          where:
            user_id: userId
            status: MarketHelper.getBankWithdrawalStatus(status)
        BankWithdrawal.findAll(query).complete callback

      findByStatus: (status, callback)->
        query =
          where:
            status: MarketHelper.getBankWithdrawalStatus(status)
          order: [
            ["created_at", "ASC"]
          ]
        BankWithdrawal.findAll(query).complete callback
      findTotalPayedByUserAndWallet: (userId, walletId, callback)->
        query =
          where:
            user_id: userId
            wallet_id: walletId
        BankWithdrawal.sum("amount", query).complete (err, totalAmount = 0)->
          return err  if err
          BankWithdrawal.sum("fee", query).complete (err, totalFee = 0)->
            return err  if err
            callback err, parseInt(math.add(MarketHelper.toBignum(totalAmount), MarketHelper.toBignum(totalFee)))

      sendWithdrawalMail: (data,callback = ()->)->
        console.log "Hello  here and there"
        console.log data
        data =
          "email": data.email
          "name": data.name
          "amount": data.amount
          "address": data.address
          "currency": data.currency
          "iban": data.iban
          "bic_swift": data.bic_swift
          "postalcode": data.postalcode
          "city": data.city
          "country": data.country
        options =
          to:
            email: GLOBAL.appConfig().alert_emails
          subject: "New Bank Withdrawal Request"
          template: "bank_withdrawal"
        emailer = new Emailer options, data
        emailer.send (err, result)->
          console.error err  if err
        callback()

      submit: (data, callback = ()->)->
        GLOBAL.coreAPIClient.sendWithData "create_bank_withdrawal", data, (err, res, body)=>
          if err
            console.error err
            return callback err, res, body
          return BankWithdrawal.findById body.id, callback  if body and body.id
          console.error "Could not create payment - #{JSON.stringify(body)}"
          callback body


  )
  BankWithdrawal
