@Invites = new Mongo.Collection('invites')

InviteSchema = new SimpleSchema
  email:
    type: String
  granted:
    type: Boolean
    defaultValue: false
  claimed:
    type: Boolean
    defaultValue: false
  geo:
    type: Object
    optional: true
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    defaultValue: new Date()
  claimedAt:
    type: Date
    optional: true
Invites.attachSchema(InviteSchema)

Invites.allow
  insert: ()-> true
  update: ()-> false
  remove: ()-> false

Invites.deny
  insert: (params)-> _.without(params, 'email', 'geo').length > 0
  update: ()-> true
  remove: ()-> true

Meteor.methods
  claimInvite: (params)-> _claimInvite(params)

_claimInvite = (params)->
  invite = Invites.findOne({_id: params._id})
  return unless invite?
  query = {_id: params._id}
  edits =
    claimed: false
    claimedAt: new Date()
  Invites.update query, {$set: edits}, CollectionUtils.dbCallback()

