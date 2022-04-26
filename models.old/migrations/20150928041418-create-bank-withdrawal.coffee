'use strict'
module.exports =
  up: (queryInterface, Sequelize) ->
    queryInterface.createTable 'bank_withdrawals',
      id:
        allowNull: false
        autoIncrement: true
        primaryKey: true
        type: Sequelize.INTEGER
      name:
        type: Sequelize.STRING
        allowNull: false
      email:
        type: Sequelize.STRING
        allowNull: false
      currency: type: Sequelize.INTEGER.UNSIGNED
      wallet_id: type: Sequelize.INTEGER.UNSIGNED
      user_id: type: Sequelize.INTEGER.UNSIGNED
      fraud: type: Sequelize.BOOLEAN
      remote_ip: type: Sequelize.STRING(16)
      amount:
        type: Sequelize.BIGINT(20)
        allowNull: false
      fee: type: Sequelize.BIGINT(20)
      iban:
        type: Sequelize.STRING
        allowNull: false
      bic_swift: type: Sequelize.STRING
      address: type: Sequelize.STRING
      postalcode: type: Sequelize.STRING
      city: type: Sequelize.STRING
      country: type: Sequelize.STRING
      comment: type: Sequelize.STRING
      bank_name: type: Sequelize.STRING
      bank_address: type: Sequelize.STRING
      bank_postalcode: type: Sequelize.STRING
      bank_city: type: Sequelize.STRING
      bank_country: type: Sequelize.STRING
      bank_currency: type: Sequelize.STRING
      type:
        type: Sequelize.INTEGER(1)
        allowNull: false
      status:
        type: Sequelize.INTEGER(1)
        allowNull: false
      is_mail_sent: type: Sequelize.BOOLEAN
      createdAt:
        allowNull: false
        type: Sequelize.DATE
      updatedAt:
        allowNull: false
        type: Sequelize.DATE
  down: (queryInterface, Sequelize) ->
    queryInterface.dropTable 'bank_withdrawals'
