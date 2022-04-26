_ = require "underscore"
_str = require "underscore.string"
Excel = require "exceljs"
fs = require "fs"
nodeExcel=require "excel-export"
dateFormat = require "date-format"
_str = require "underscore.string"
MarketHelper = require "./market_helper"

# Process the data
# create columns array
# fill the data in the rows
# return the

ExcelHelper =
  downloadExcel: ()->
    console.log 'Excel Helper Called'
    workbook = new Excel.Workbook()
    workbook.creator = "Me"
    workbook.lastModifiedBy = "Her"
    workbook.created = new Date(1985, 8, 30)
    workbook.modified = new Date()
    worksheet = workbook.addWorksheet("My Sheet")

    worksheet.columns = [
      { header: "Id", key: "id", width: 10 },
      { header: "Name", key: "name", width: 32 },
      { header: "D.O.B.", key: "DOB", width: 10 }
    ]

    worksheet.addRow({id: 1, name: "John Doe", dob: new Date(1970,1,1)})
    worksheet.addRow({id: 2, name: "Jane Doe", dob: new Date(1965,1,7)})

    workbook.xlsx.writeFile('report.xlsx')
    .then ()->
      console.log 'Done exporting the excel file'

  processOrders: (orders)->
    data =[]
    _.each orders,((order,index,list)->
        data.push(_.values this.getOrderData order)
    ),this
    data

  processTransactions: (transactions)->
    data =[]
    _.each transactions,((transaction,index,list)->
      data.push(_.values this.getTransactionData transaction)
    ),this
    data

  processBankWithdrawals: (withdrawals)->
    data =[]
    _.each withdrawals,((withdrawal,index,list)->
      data.push(_.values this.getBankWithdrawalData withdrawal)
    ),this
    data


  getOrderData: (order)->
    type:           order.type
    market:         order.sell_currency + '/' + order.buy_currency
    created_at:     order.created_at
    action:         order.action
    unit_price:     order.getFloat "unit_price"
    amount:         order.getFloat "amount"
    result_amount:  order.getFloat "result_amount"

  getTransactionData: (transaction)->
    id:                transaction.id
    created_at:        transaction.created_at
    category:          transaction.category
    amount:            transaction.getFloat "amount"
    address:           transaction.address
    txid:              transaction.txid
    currency:          transaction.currency
    fee:               transaction.getFloat "fee"
    confirmations:     transaction.confirmations

  getBankWithdrawalData: (withdrawal)->
    id:                withdrawal.id
    created_at:        withdrawal.created_at
    name:              withdrawal.name
    email:             withdrawal.email
    iban:              withdrawal.iban
    bic:               withdrawal.bic_swift
    type:              withdrawal.getTypeLiteral "type"
    amount:            withdrawal.getFloat "amount"
    fee:               withdrawal.getFloat "fee"
    currency:          withdrawal.currency
    bank_currency:     withdrawal.bank_currency

  getExcelConfForCompletedOrders: (orders,callback = ()->)->
    data = @processOrders(orders)
    conf= {}
    serialNumber = 0
    conf.cols = [
      {
        caption: 'Sl.No'
        type: 'number'
        width: 12
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            serialNumber =serialNumber+1
            serialNumber
      },
      {
        caption: 'Market'
        type: 'string'
        width: 50
      },
      {
        caption: 'Date'
        type: 'String'
        width: 15
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'N.A' if not cellData?
            return dateFormat('dd-MM-y hh:mm',cellData)
      },
      {
        caption: 'Type'
        type: 'string'
        width: 10
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'Not Specified' if not cellData?
            return  cellData.toUpperCase()
      },
      {
        caption: 'Price'
        type: 'number'
        width: 10
      },
      {
        caption: 'Amount'
        type: 'number'
        width: 10
      }
      {
        caption: 'Total'
        type: 'number'
        width: 10
      }

    ]
    conf.rows = data
#    conf.stylesXmlFile = "styles.xml"
    callback(null, conf)


  getExcelConfForCompletedTransactions: (transactions,callback = ()->)->
    data = @processTransactions(transactions)
    conf= {}
    serialNumber = 0
    conf.cols = [
      {
        caption: 'Sl.No'
        type: 'number'
        width: 5
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            serialNumber =serialNumber+1
            serialNumber
      },
      {
        caption: 'Date'
        type: 'string'
        width: 15
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'N.A' if not cellData?
            return dateFormat('dd-MM-y hh:mm',cellData)
      },
      {
        caption: 'Category'
        type: 'string'
        width:10
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'Not Specified' if not cellData?
            return  cellData.toUpperCase()
      },
      {
        caption: 'Amount'
        type: 'number'
        width: 10
      },
      {
        caption: 'Address'
        type: 'string'
        width: 40
      },
      {
        caption: 'Transaction ID'
        type: 'string'
        width: 70
      },
      {
        caption: 'Currency'
        type: 'string'
        width: 10
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'Not Specified' if not cellData?
            return  cellData.toUpperCase()
      },
      {
        caption: 'Fee'
        type: 'number'
        width: 10
      }
      {
        caption: 'Confirmations'
        type: 'number'
        width: 10
      }

    ]
    conf.rows = data
#    conf.stylesXmlFile = "./styles.xml"

    callback(null, conf)


  getExcelConfForCompletedBankWithdrawals: (withdrawals,callback = ()->)->
    data = @processBankWithdrawals(withdrawals)
    console.log data
    conf= {}
    serialNumber = 0
    conf.cols = [
      {
        caption: 'Sl.No'
        type: 'number'
        width: 12
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            serialNumber =serialNumber+1
            serialNumber
      },

      {
        caption: 'Date'
        type: 'String'
        width: 15
        beforeCellWrite: do ->
          (row, cellData, eOpt) ->
            return 'N.A' if not cellData?
            return dateFormat('dd-MM-y hh:mm',cellData)
      },
      {
        caption: 'Name'
        type: 'string'
        width: 50
      },
      {
        caption: 'Email'
        type: 'string'
        width: 50
      },
      {
        caption: 'IBAN'
        type: 'string'
        width: 50
      },
      {
        caption: 'SWIFT/BIC'
        type: 'string'
        width: 50
      },
      {
        caption: 'TYPE'
        type: 'string'
        width: 50
      },
      {
        caption: 'Amount'
        type: 'number'
        width: 10
      },
      {
        caption: 'Fee'
        type: 'number'
        width: 10
      },
      {
        caption: 'Currency'
        type: 'number'
        width: 50
      },
      {
        caption: 'Bank Currency'
        type: 'string'
        width: 50
      }

    ]
    conf.rows = data
    #    conf.stylesXmlFile = "./styles.xml"

    callback(null, conf)


exports = module.exports = ExcelHelper