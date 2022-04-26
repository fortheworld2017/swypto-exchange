(function() {
  var Excel, Helper, _, _str, dateFormat, exports, fs, nodeExcel;

  _ = require("underscore");

  _str = require("underscore.string");

  Excel = require("exceljs");

  fs = require("fs");

  nodeExcel = require("excel-export");

  dateFormat = require("date-format");

  _str = require("underscore.string");

  Helper = {
    profileActive: function(page) {
      switch (page) {
        case 'profile':
          return 1;
        case 'verify-account':
          return 1;
        case 'security':
          return 1;
        case 'history':
          return 1;
        case 'notifications':
          return 1;
        case 'transactions':
          return 1;
        case 'account-balance':
          return 1;
        case 'open-orders':
          return 1;
        default:
          return 0;
      }
    }
  };

  exports = module.exports = Helper;

}).call(this);
