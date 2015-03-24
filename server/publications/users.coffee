# Meteor.publish "userStatus", ()->
#   selector = {_id: Meteor.userId}
#   projection = { fields: {'status.online':1} }
#   return Meteor.users.find(selector, projection)

Meteor.publish 'user', ()->
  q = {_id: @userId}
  return Meteor.users.find(q)

Meteor.publish 'friends', (params)->
  # params.latitude, params.longitude
  q = {}
  fields =
    profile: 1
    status: 1
  return Meteor.users.find() #redFlag

Meteor.publish 'strangers', (params)->
  # params.latitude, params.longitude
  q = {}
  fields =
    profile: 1
    status: 1
  return Meteor.users.find() #redFlag
