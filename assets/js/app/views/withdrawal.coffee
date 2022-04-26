class App.WithdrawalView extends App.MasterView
  tpl: null
  model: null
  currency: null

  initialize: (options)->
    @tpl = options.tpl  if options.tpl
    @model = options.model  if options.model
    @currency =options.currency if options.currency
    @type =options.type if options.type
    $.subscribe "payment-processed", @onPaymentProcessed
    $.subscribe "wallet-balance-loaded", @onWalletBalanceLoaded
    $.subscribe "wallet-balance-changed", @onWalletBalanceChanged

  render: ()->
    content = @template
      payment: @model
      type: @type
    this.$el.html(content)
    ($ @el).appendTo('#form-container')
    console.log @type
    @setupBTCFormValidator() if @type =='BTC'
    @setupXWBCFormValidator() if @type =='XWBC'
    @setupEuBankFormValidator() if @type =='EU'
    @setupInBankFormValidator() if @type =='Inter'

  setupBTCFormValidator: ()->
    $.validator.addMethod "cryptoAddress", (value, element)->
      App.Helpers.CryptoCurrency.isValidAddress value
    @$("#bitcoin-withdraw-form").validate
      errorClass:'lb error'
      rules:
        amount:
          required: true
          number: true
          min: 0.000001
        address:
          required:
            depends: ()->
              $(this).val($.trim($(this).val()))
              true
          cryptoAddress: true
      messages:
        amount:
          required: "Please provide an amount."
        address:
          required: "Please provide an address."
          cryptoAddress: "Please provide a valid address."
      submitHandler: (form)=>
        $form = $(form)
        amount = _.str.satoshiRound $form.find("[name='amount']").val()
        if _.isNumber(amount) and amount > 0
          $form.find("button").attr "disabled", true
          @model = new App.PaymentModel
            amount:_.str.satoshiRound $form.find("[name='amount']").val()
            wallet_id: $form.find("[name='wallet_id']").val()
            address: $form.find("[name='address']").val()
            label: $form.find("[name='label']").val()
        confirmationView = new App.ConfirmationView
          model: @model
#          el: '#form-container'
          rootElement: '#form-container'
          id: 'confirm-div'
          tpl: "withdrawal-confirmation-tpl"
          type: @type
        confirmationView.render()
        this.close()
        #  @onPay form withdrawal-confirmation
      
  setupXWBCFormValidator: ()->
    $.validator.addMethod "cryptoAddress", (value, element)->
      App.Helpers.CryptoCurrency.isValidAddress value
    @$("#xwbc-withdraw-form").validate
      errorClass:'lb error'
      rules:
        amount:
          required: true
          number: true
          min: 0.000001
        address:
          required:
            depends: ()->
              $(this).val($.trim($(this).val()))
              true
          cryptoAddress: true
      messages:
        amount:
          required: "Please provide an amount."
        address:
          required: "Please provide an address."
          cryptoAddress: "Please provide a valid address."
      submitHandler: (form)=>
        $form = $(form)
        amount = _.str.satoshiRound $form.find("[name='amount']").val()
        if _.isNumber(amount) and amount > 0
          $form.find("button").attr "disabled", true
          @model = new App.PaymentModel
            amount:_.str.satoshiRound $form.find("[name='amount']").val()
            wallet_id: $form.find("[name='wallet_id']").val()
            address: $form.find("[name='address']").val()
            label: $form.find("[name='label']").val()
        confirmationView = new App.ConfirmationView
          model: @model
#          el: '#form-container'
          rootElement: '#form-container'
          id: 'confirm-div'
          tpl: "withdrawal-confirmation-tpl"
          type: @type
        confirmationView.render()
        this.close()
        #  @onPay form withdrawal-confirmation

  setupEuBankFormValidator: ()->
    $.validator.addMethod "ibanValidate",(value,element)->
      if IBAN.isValid(value)
        return true
      else
        return false
    @$("#bank-withdraw-form").validate
      errorClass:'lb error'
      rules:
        amount:
          required: true
          number: true
          min: 1
        email:
          required: true
          email: true
        iban:
          required: true
          ibanValidate: true
        bic_swift:
          required: true
        address:
          required: true
        postalcode:
          required: true
        city:
          required: true
        country:
          required: true
      messages:
        amount:
          required: "Please provide an amount."
          min: "The minimum withdrawal amount is \u20AC100"
        address:
          required: "Please provide an address."
        email:
          required: "Please provide an amount."
          email: "Please provide a valid email"
        iban:
          required: "Please provide a valid IBAN"
          ibanValidate: "IBAN entered is invalid"
        bic_swift:
          required: "Please provide a valid BIC/SWIFT"
        address:
          required: "Please provide a valid Addres"
        postalcode:
          required: "Please provide a valid postal code"
        city:
          required: "Please provide a valid city"
        country:
          required: "Please provide a valid country"
      submitHandler: (form)=>
        $form = $(form)
        amount = _.str.satoshiRound $form.find("[name='amount']").val()
        if _.isNumber(amount) and amount > 0
          $form.find("button").attr "disabled", true
          @model = new App.BankWithdrawalModel
            amount:_.str.satoshiRound $form.find("[name='amount']").val()
            wallet_id: $form.find("[name='wallet_id']").val()
            type: $form.find("[name='type']").val()
            label: $form.find("[name='label']").val()
            email: $form.find("[name='email']").val()
            name: $form.find("[name='name']").val()
            iban: $form.find("[name='iban']").val()
            bic_swift: $form.find("[name='bic_swift']").val()
            address: $form.find("[name='address']").val()
            postalcode: $form.find("[name='postalcode']").val()
            city: $form.find("[name='city']").val()
            country: $form.find("[name='country']").val()

        confirmationView = new App.ConfirmationView
          model: @model
#          el: '#form-container'
          rootElement: '#form-container'
          id: 'confirm-div'
          tpl: "withdrawal-confirmation-tpl"
          type: @type
        confirmationView.render()
        this.close()
        #        @onPay form withdrawal-confirmation

  setupInBankFormValidator: ()->
    $.validator.addMethod "ibanValidate",(value,element)->
      if IBAN.isValid(value)
        return true
      else
        return false
    @$("#bank-withdraw-form").validate
      errorClass:'lb error'
      rules:
        amount:
          required: true
          number: true
          min: 1
        email:
          required: true
          email: true
        iban:
          required: true
          ibanValidate: true
        bic:
          required: true
        swift:
          required: true
        address:
          required: true
        postalcode:
          required: true
        city:
          required: true
        country:
          required: true
      messages:
        amount:
          required: "Please provide an amount."
          min: "The minimum withdrawal amount is \u20AC150"
        address:
          required: "Please provide an address."
        email:
          required: "Please provide an amount."
          email: "Please provide a valid email"
        iban:
          required: "Please provide a valid IBAN"
          ibanValidate: "IBAN entered is invalid"
        bic_swift:
          required: "Please provide a valid BIC/SWIFT"
        address:
          required: "Please provide a valid Addres"
        postalcode:
          required: "Please provide a valid postal code"
        city:
          required: "Please provide a valid city"
        country:
          required: "Please provide a valid country"

      submitHandler: (form)=>
        $form = $(form)
        amount = _.str.satoshiRound $form.find("[name='amount']").val()
        if _.isNumber(amount) and amount > 0
          $form.find("button").attr "disabled", true
          @model = new App.BankWithdrawalModel
            amount:_.str.satoshiRound $form.find("[name='amount']").val()
            wallet_id: $form.find("[name='wallet_id']").val()
            type: $form.find("[name='type']").val()
            label: $form.find("[name='label']").val()
            email: $form.find("[name='email']").val()
            name: $form.find("[name='name']").val()
            iban: $form.find("[name='iban']").val()
            bic_swift: $form.find("[name='bic_swift']").val()
            address: $form.find("[name='address']").val()
            postalcode: $form.find("[name='postalcode']").val()
            city: $form.find("[name='city']").val()
            country: $form.find("[name='country']").val()
            bank_name: $form.find("[name='bank_name']").val()
            bank_address: $form.find("[name='bank_address']").val()
            bank_postalcode: $form.find("[name='bank_postalcode']").val()
            bank_city: $form.find("[name='bank_city']").val()
            bank_country: $form.find("[name='bank_country']").val()
            bank_currency: $form.find("[name='bank_currency']").val()

        confirmationView = new App.ConfirmationView
          model: @model
#          el: '#form-container'
          rootElement: '#form-container'
          id: 'confirm-div'
          tpl: "withdrawal-confirmation-tpl"
          type: @type
        confirmationView.render()
        this.close()
#        @onPay form withdrawal-confirmation





  onPay: (form)->
    $form = $(form)
    amount = _.str.satoshiRound $form.find("[name='amount']").val()
    if _.isNumber(amount) and amount > 0
      $form.find("button").attr "disabled", true
      payment = new App.PaymentModel
        wallet_id: $form.find("[name='wallet_id']").val()
        amount: amount
        address: $form.find("[name='address']").val()
      payment.save null,
        success: ()->
          $form.find("button").attr "disabled", false
          $.publish "notice", "Your withdrawal will be processed soon."
          $.publish "payment-submited", payment
        error: (m, xhr)->
          $form.find("button").attr "disabled", false
          $.publish "error", xhr
    else
      $.publish "error", "Please submit a proper amount."