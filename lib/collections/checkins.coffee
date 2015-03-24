# @Checkins = new Mongo.Collection('checkins')

# # _allowedFriendTypes = CollectionUtils.allowedFriendTypes

# CheckinSchema = new SimpleSchema
#   userId:
#     type: String
#   message:
#     type: String
#     optional: true
#   publishedStatus:
#     type: String
#     # allowedValues: _allowedFriendTypes
#     allowedValues: ['down to chill', 'down to studybuddy', 'unavailable']
#     defaultValue: 'down to chill'
#   targetAudience:
#     type: String
#     # allowedValues: _allowedFriendTypes.toArray()
#     allowedValues: ['besties', 'new friends', 'facebook', 'second degree', 'all contacts']
#     defaultValue: 'besties'
#   tribeIds:
#     type: [String]
#     optional: true
#     defaultValue: []
#   # status:
#       # online: 
#         # type: Boolean
#       # idle: 
#         # type: Boolean
#   geoJson:
#     type: Object
#   createdAt:
#     type: Date
#     defaultValue: new Date()
#   updatedAt:
#     type: Date
#     # autoValue: new Date()
#     defaultValue: new Date()
# Checkins.attachSchema(CheckinSchema)

# Checkins.allow
#   insert: (userId, checkin)-> false
#   update: (userId, checkin)-> Permissions.ownsDocument(userId, checkin)
#   remove: (userId, checkin)-> false

# Checkins.deny 
#   update: (userId, checkin, fieldNames)-> 
#     _.without(fieldNames, 'tribeIds', 'title', 'geoJson', 'latitude', 'longitude').length > 0

# Checkins.deny
#   update: (userId, checkin, fieldNames, modifier)-> false

# Meteor.methods
#   updateCheckinWithLatLng: (params)-> _updateCheckinWithLatLng(@userId, params)

# _updateCheckinWithLatLng = (userId, params)->
#   check(userId, String)
#   check(params._id, String)
#   check(params.latitude, Number)
#   check(params.longitude, Number)

#   query = {_id: params._id}
#   fieldUpdates =
#     'geoJson.geometry.coordinates': [params.longitude, params.latitude]
#     updatedAt: new Date()
#   Checkins.update query, {$set: fieldUpdates}, CollectionUtils.dbCallback()




