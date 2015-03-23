@handleResponse = (err, res)->
  if err?.message
    throwError(err.message)
  else
    Alerts.set('Success! Boo yah.', 'success')