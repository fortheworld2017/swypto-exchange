_ = require "underscore"
_str = require "underscore.string"
Excel = require "exceljs"
fs = require "fs"
nodeExcel=require "excel-export"
dateFormat = require "date-format"
_str = require "underscore.string"

Helper =

  #Set the Profile Menu as active based on the page
  profileActive : (page) ->
    switch page
      when 'profile' then 1
      when 'verify-account' then 1
      when 'security' then 1
      when 'history' then 1
      when 'notifications' then 1
      when 'transactions' then 1
      when 'account-balance' then 1
      when 'open-orders' then 1
      else 0

exports = module.exports = Helper
