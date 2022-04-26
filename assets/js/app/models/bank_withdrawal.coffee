window.App or= {}

class App.BankWithdrawalModel extends Backbone.Model

  urlRoot: "/bank-withdrawals"

  getCreatedDate: ()->
    new Date(@get('created_at')).format('dd.mm.yy H:MM')
