class App.SampleView extends App.MasterView
  tpl: null

  model: null

  collection: null

  hideOnEmpty: false

  initialize: (options = {})->
    @model = options.model if options.model
    @tpl = options.tpl  if options.tpl

  events:
    'click #cancel-button': 'cancelSubmission'
    'click #confirm-button': 'confirmSubmission'

  render: () ->
    content = @template
      payment: @model
    this.$el.html(content)


  cancelSubmission: ()->
    p = new App.WithdrawalView
      model: @model
      el: '#form-container'
      tpl: "btc-form"
    p.render()

# save data, if success, show confirmation (slack/separate page)
  confirmSubmission: ()->
