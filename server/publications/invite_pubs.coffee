Meteor.publish 'invite', (_id)->
  query = {_id: _id}
  fields = {email: 0}
  return Invites.find(query, fields)