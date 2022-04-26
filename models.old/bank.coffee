MarketHelper = undefined
math = undefined
_ = undefined
MarketHelper = require('../lib/market_helper')
_ = require('underscore')
math = require('../lib/math')

module.exports = (sequelize, DataTypes) ->
  Bank = sequelize.define "Bank",
      id:
        type: DataTypes.STRING(255)
        allowNull: false
      RoutingCode:
        type: DataTypes.STRING(64)
        allowNull: true
      Name:
        type: DataTypes.STRING(128)
        allowNull: true
      Number:
        type: DataTypes.STRING(64)
        allowNull: true
        unique: true
      IBAN:
        type: DataTypes.STRING(64)
        allowNull: true
        unique: true
      BankName:
        type: DataTypes.STRING(64)
        allowNull: true
      BankAddress:
        type: DataTypes.STRING(64)
        allowNull: true
      SortCode:
        type: DataTypes.STRING(64)
        allowNull: true
      RoutingNumber:
        type: DataTypes.STRING(64)
        allowNull: true
      SWIFT:
        type: DataTypes.STRING(64)
        allowNull: true
      IFSC:
        type: DataTypes.STRING(64)
        allowNull: true
      bankCountry:
        type: DataTypes.STRING(64)
        allowNull: true
      bankCity:
        type: DataTypes.STRING(64)
        allowNull: true
      bankPostalCode:
        type: DataTypes.STRING(10)
        allowNull: true
      preferredCurrency:
        type: DataTypes.STRING(64)
        allowNull: true
    ,
      tableName: 'bank'
      timestamps: false
      getterMethods: account: ->
        'bank_' + @user_id
      classMethods:
        findById: (userId, callback = ()->)->
          Bank.find({where:{id: userId}}).complete callback
        setName: (name, callback = ()->)->
          Bank.Name = name
          Bank.Name.save().complete callback
        createNewBank: (data, callback)->
          bankData = _.extend({}, data)
          Bank.create(bankData).complete callback

      instanceMethods:
        updateAttributes: (data, callback = ()->)->
          @Name = data.name  if data.name? and data.name isnt @name
          @BankName = data.bank_name  if data.bank_name? and data.bank_name isnt @bank_name
          @SWIFT = data.swift  if data.swift? and data.swift isnt @swift
          @IBAN = data.iban  if data.iban? and data.iban isnt @iban
          @BankAddress = data.bank_address  if data.bank_address? and data.bank_address isnt @bank_address
          @bankCountry = data.country  if data.country? and data.country isnt @country
          @bankCity = data.bank_city  if data.bank_city? and data.bank_city isnt @bank_city
          @bankPostalCode = data.bank_post_code  if data.bank_post_code? and data.bank_post_code isnt @bank_post_code
          @preferredCurrency = data.preferred_currency  if data.preferred_currency? and data.preferred_currency isnt @preferred_currency
          @save().complete callback



  Bank