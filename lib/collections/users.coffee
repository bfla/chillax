Meteor.methods
  updateUserLocation: (params)-> _updateLocation(@userId, params)
  addTribeForUser: (params)-> _addTribe(@userId, params)
  removeTribeForUser: (params)-> _removeTribe(@userId, params)

_updateLocation = (userId, params)->
  # requires latitude and longitude
  return unless userId
  user = Meteor.users.findOne(userId)
  geojson = user.currentLocation
  geojson ||= CollectionsShared.initGeojson()
  geojson.geometry.coordinates = [params.latitude, params.longitude]

  q = {_id: user._id}
  edits = {$set: {'geojson': geojson} }
  Meteor.users.update q, edits, CollectionUtils.dbCallback()

_addTribe = (userId, params)->
  # requires tribeId param
  return unless Tribes.findOne(params.tribeId) # only allow real tribes
  return unless userId # only if the user is logged in
  user = Meteor.users.findOne({_id: userId})
  tribeIds = user.profile.tribeIds
  return if _.contains(tribeIds, params.tribeId) # Don't add it if it's already added
  return if tribeIds.length > 2 #Only allow 3 tribes at a time
  q = {_id: userId}
  updates = {$push: {'profile.tribeIds': params.tribeId}}
  Meteor.users.update q, updates, CollectionUtils.dbCallback()

_removeTribe = (userId, params)->
  # requires tribeId param
  return unless userId # only if the user is logged in
  user = Meteor.users.findOne({_id: userId})
  return unless user
  tribeIds = user.profile.tribeIds
  return unless _.contains(tribeIds, params.tribeId) #Only hit database if tribe Id is one of the user's
  tribeIds = _.without(tribeIds, params.tribeId)
  q = {_id: userId}
  updates = {$set: {'profile.tribeIds': tribeIds}}
  Meteor.users.update q, updates, CollectionUtils.dbCallback()

@UserMethods = {}

UserMethods.getUserLongitude = ()->
  return null unless Meteor.users.findOne(Meteor.userId())
  user = Meteor.users.findOne(Meteor.userId())
  console.log "userObj:", user
  longitude = user.profile.currentLocation.geometry.coordinates[0]

UserMethods.getUserLatitude = ()->
  return null unless Meteor.users.findOne(Meteor.userId())
  user = Meteor.users.findOne(Meteor.userId())
  latitude = user.profile.currentLocation.geometry.coordinates[1]

UserMethods.checkIfUserIsInTribe = (tribeId)->
  userId = Meteor.userId()
  user = Meteor.users.findOne(userId)
  return user?.profile?.tribeIds and _.contains(user.profile.tribeIds, tribeId)
