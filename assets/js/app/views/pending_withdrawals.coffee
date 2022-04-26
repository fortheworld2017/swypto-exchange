class App.PendingWithdrawalsView extends App.MasterView

  tpl: "pending-withdrawal-tpl"

  collection: null

  payments: null

  initialize: (options = {})->
    @payments = options.payments
    @hideOnEmpty = options.hideOnEmpty  if options.hideOnEmpty
#    @toggleVisible()
#    $.subscribe "payment-submited", @onPaymentSubmited
#    $.subscribe "payment-processed", @onPaymentProcessed
#    $.subscribe "transaction-update", @onTransactionUpdate
    $.subscribe "wallet-balance-changed", @onWalletBalanceChanged

  render: ()->
    @collection.fetch
      success: ()=>
        @disableExcel() if @collection.length < 1
        @collection.each (withdrawal)=>
          $tx = @template
            withdrawal: withdrawal
          $existentTx = @$("[data-id='#{withdrawal.id}']")
          if not $existentTx.length
            @$el.prepend $tx
          else
            $existentTx.replaceWith $tx
        @toggleVisible()  if @hideOnEmpty

  onTransactionUpdate: (ev, transaction)=>
    @render()
    @$("[data-id='#{transaction.id}']").remove()  if transaction.get("balance_loaded")

  onPaymentProcessed: (ev, payment)=>
    @render()
    @$("[data-id='#{payment.id}']").remove()

  onPaymentSubmited: (ev, payment)=>
    @render()

  onWalletBalanceChanged: (ev, wallet)=>
    @render()

  disableExcel: ()->
    $exportCompletedTransactions = $('#export-excel-withdrawals')
    if $exportCompletedTransactions.length > 0
      $exportCompletedTransactions.hide()
