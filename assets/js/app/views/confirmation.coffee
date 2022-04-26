class App.ConfirmationView extends App.MasterView
  tpl: null

  model: null

  collection: null

  hideOnEmpty: false

  initialize: (options = {})->
    @model = options.model if options.model
    @tpl = options.tpl  if options.tpl
    @type =options.type if options.type
    @rootElement =options.rootElement if options.rootElement


  events:
    'click #cancel-button': 'cancelSubmission'
    'click #confirm-button': 'confirmSubmission'

  render: () ->
    content = @template
      payment: @model
      type: @type
    this.$el.html(content)
    ($ @el).appendTo(@rootElement)


  cancelSubmission: ()->
    if @type=='BTC'
      template = "btc-form"
    else if @type=='XWBC'
      template = "xwbc-form"
    else if @type=='EU'
      template = "bank-form"
    else if @type=='Inter'
      template = "bank-form"
    p = new App.WithdrawalView
      model: @model
#      el: '#form-container'
      tpl: template
      type: @type
    p.render()
    this.close()

# save data, if success, show confirmation (slack/separate page)
  confirmSubmission: ()=>
    if @type=='BTC'
      template = "btc-form"
    else if @type=='XWBC'
      template = "xwbc-form"
    else if @type=='EU'
      template = "bank-form"
    else if @type=='Inter'
      template = "bank-form"
    @model.save null,
      success: ()=>
        p = new App.WithdrawalView
          model: null
          tpl: template
          type: @type
        p.render()
        $.publish "notice", "Your withdrawal will be processed soon."
        $.publish "payment-submited", @model

      error: (m, xhr)=>
        k = new App.WithdrawalView
          model: @model
          tpl: template
          type: @type
        k.render()
        $.publish "error", xhr
    this.close()

