class App.NotificationSettingsView extends App.MasterView

  tpl: null

  model: null

  events:
    "change input[type='checkbox']": "onSettingsChange"

  initialize: (options = {})->

  onSettingsChange: (ev)->
    $input = $(ev.target)
    data = {}
    data[$input.attr("name")] = $input.is(":checked")
    @model.save data,
      success: ()->
        $.publish "error", "Settings successfully saved."
      error: (m, xhr)->
        $.publish "error", xhr

