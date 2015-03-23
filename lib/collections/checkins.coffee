@Checkins = new Mongo.Collection('checkins')

CheckinSchema = new SimpleSchema
  userId:
    type: String
  targetAudience:
    type: String
    allowedValues: ['besties', 'new', 'contacts']
    defaultValue: 'besties'
  tribeIds:
    type: [String]
    optional: true
    defaultValue: []
  geoJson:
    type: Object
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    defaultValue: new Date()
Checkins.attachSchema(CheckinSchema)

Checkins.allow
  insert: (userId, checkin)-> false
  update: (userId, checkin)-> Permissions.ownsDocument(userId, checkin)
  remove: (userId, checkin)-> false

Checkins.deny 
  update: (userId, checkin, fieldNames)-> 
    _.without(fieldNames, 'tribeIds', 'title', 'geoJson', 'latitude', 'longitude').length > 0

Checkins.deny
  update: (userId, checkin, fieldNames, modifier)-> false

Meteor.methods
  updateCheckinWithLatLng: (params)-> _updateCheckinWithLatLng(@userId, params)

_updateCheckinWithLatLng = (userId, params)->
  check(userId, String)
  check(params._id, String)
  check(params.latitude, Number)
  check(params.longitude, Number)

  query = {_id: params._id}
  fieldUpdates =
    'geoJson.geometry.coordinates': [params.longitude, params.latitude]
    # updatedAt: new Date()
  Checkins.update query, {$set: fieldUpdates}, CollectionUtils.dbCallback()



