window.App or= {}

class App.BankModel extends Backbone.Model

  urlRoot: "/bank"
  defaults: {
    name: '',
    country: '',
    IBAN: '',
    SWIFT: '',
  },
