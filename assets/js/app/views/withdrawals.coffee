class App.WithdrawalsView extends App.MasterView


  initialize: (options)->
    $.subscribe "payment-processed", @onPaymentProcessed
    $.subscribe "wallet-balance-loaded", @onWalletBalanceLoaded
    $.subscribe "wallet-balance-changed", @onWalletBalanceChanged



  renderWalletBalance: (walletId)->
    wallet = new App.WalletModel
      id: walletId
    wallet.fetch
      success: ()=>
        @$("[data-wallet-balance-id='#{walletId}']").html _.str.toFixed(wallet.get("balance") + wallet.get("hold_balance"))
        @$("[data-wallet-hold-balance-id='#{walletId}']").text _.str.toFixed(wallet.get("hold_balance"))
        @$("[data-wallet-available-balance-id='#{walletId}']").text _.str.toFixed(wallet.get("balance"))

  onAddWallet: (ev)->
    ev.preventDefault()
    $form = $(ev.target)
    $form.find("button").attr "disabled", true
    wallet = new App.WalletModel
      currency: $form.find("#currency-type").val()
    wallet.save null,
      success: ()->
        window.location.reload()
      error: (m, xhr)->
        $.publish "error", xhr
        $form.find("button").attr "disabled", false


  onAvailableBalanceClick: (ev)->
    ev.preventDefault()
    $target = $(ev.target)
    amount = _.str.satoshiRound  App.math.add(parseFloat($target.text()), -parseFloat($target.data("withdrawal-fee")))
    $("#withdrawal-amount").val amount

  onPaymentProcessed: (ev, payment)=>
    @renderWalletBalance payment.get("wallet_id")

  onWalletBalanceLoaded: (ev, wallet)=>
    @renderWalletBalance wallet.id

  onWalletBalanceChanged: (ev, wallet)=>
    @renderWalletBalance wallet.id
