class App.UserBankEditView extends App.MasterView

  tpl: null

  model: null

#  events:
#    "submit #profile-edit-form": "onProfileEditFormSubmit"
#     "blur #email" : "onEmailBlur"

  initialize: (options = {})->
    @setupFormValidators()


  onBankEditFormSubmit: (form,ev)->
    ev.preventDefault()
    $form = $(ev.target)
    data=
      name : $form.find("[name='account_holder_name']").val()
      bank_name : $form.find("[name='bank_name']").val()
      bank_address : $form.find("[name='bank_address']").val()
      bank_city : $form.find("[name='bank_city']").val()
      bank_post_code : $form.find("[name='bank_post_code']").val()
      country : $form.find("[name='bank_country']").val()
      iban : $form.find("[name='iban']").val()
      swift : $form.find("[name='swift_code']").val()
      preferred_currency : $form.find("[name='preferred_currency']").val()
    @model.save data,
      success: ()->
        $.publish "error", "Settings successfully saved."
      error: (m,xhr)->
        $.publish "error", xhr
        console.dir xhr.responseJSON.error
        $form.find("#error-cnt").text 'Updating settings failed. Error: '+xhr.responseJSON.error

  setupFormValidators: ()->
    @$("#bank-edit-form").validate
      errorClass:'lb error'
      rules:
        account_holder_name:
          required: true
        iban:
          required:false
          ibanValidate:false
      messages:
        account_holder_name:
          required: "Please provide the account holder's name."
        iban:
          required:"Please enter2 provide a IBAN number"
          ibanValidate: "Please enter a valid IBAN"

      submitHandler: (form, ev)=>
        @onBankEditFormSubmit form,ev
        return false
    $.validator.addMethod "ibanValidate",(value,element)->
      if IBAN.isValid(value) == true
        return true
      else
        return false

  onEmailBlur: (ev)->
    $("#profile-edit-form").validate()
    return false
