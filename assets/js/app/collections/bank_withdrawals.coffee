class window.App.BankWithdrawalsCollection extends Backbone.Collection

  type: null

  walletId: null

  url: ()->
    url = "/bank-withdrawals"
    params = {}
    params.status    = @status     if @status
    params.type = @type if @type
    url += "?#{$.param(params)}"
    url
  model: window.App.BankWithdrawalModel

  initialize: (models, options = {})->
    @type = options.type
    @walletId = options.walletId
    @status = options.status
