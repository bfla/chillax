Template.joinTribes.helpers
  # tribes: ()-> Tribes.find()
  creators: ()-> returnTribeDocsMatchingCategory('creators', Tribes.find().fetch())
  analysts: ()-> returnTribeDocsMatchingCategory('analysts', Tribes.find().fetch())
  doers: ()-> returnTribeDocsMatchingCategory('doers', Tribes.find().fetch())
  userIsInTribe: (tribeId)-> UserMethods.checkIfUserIsInTribe(tribeId)

# tribes = ()-> Tribes.find()

returnTribeDocsMatchingCategory = (categoryStr, tribesJson)->
  tribes = _.filter tribesJson, (tribe)-> return tribe.category is categoryStr
  return tribes

Template.joinTribes.events
  'click .tribe-join-checkbox': (e)-> addOrRemoveTribeFromCheckbox(e)

addOrRemoveTribeFromCheckbox = (e)->
  $target = $(e.target)
  params = {tribeId: $target.data('tribe')}
  if $target.is(":checked")
    console.log 'adding tribe...', params
    Meteor.call 'addTribeForUser', params, Helpers.handleGenericResponse()
  else
    console.log 'removing tribe...', params
    Meteor.call 'removeTribeForUser', params, Helpers.handleGenericResponse()

