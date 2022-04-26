class App.PaymentHistoryView extends App.MasterView

  tpl: "payment-history-tpl"

  collection: null

  initialize: (options = {})->
    @hideOnEmpty = options.hideOnEmpty  if options.hideOnEmpty
    #    @todo check if any views are breaking due to commenting the next line
    #    @toggleVisible()
    $.subscribe "payment-processed", @onPaymentProcessed
    $.subscribe "transaction-update", @onTransactionUpdate

  render: ()->
    @collection.fetch
      success: ()=>
        @renderPayments()
        @toggleVisible()  if @hideOnEmpty


  renderPayments: ()->
    @collection.each (payment)=>
      $existentPayment = @$("[data-id='#{payment.id}']")
      tpl = @template
        payment: payment
      @$el.append tpl
      $existentPayment.replaceWith tpl  if $existentPayment.length

  onTransactionUpdate: (ev, transaction)=>
    @render()

  onPaymentProcessed: (ev, payment)=>
    @render()
