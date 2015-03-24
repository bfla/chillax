Helpers = {}

Helpers.handleGenericResponse = (err, res)->
  if err?.message
    Helpers.throwError(err.message)
  else
    Alerts.set('Success! Boo yah.', 'success')

Helpers.flash = (message)-> Alerts.set(message, 'primary')

Helpers.throwError = (message)->
  console.log 'Error... ' + message
  Alerts.set(message, 'warning')