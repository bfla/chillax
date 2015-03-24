# Meteor.publish 'checkin', ()->
#   return Checkins.find({userId: @userId})

# Meteor.publish 'checkins', (params)->
#   # params.latitude and params.longitude
#   query = {} #redFlag - should only return nearby checkins
#   fields =
#     _id: 0
#     userId: 0
#     geoJson: 0
#     message: 1
#     publishedStatus: 1
#     targetAudience: 1
#     tribeIds: 1

#   return Checkins.find(query, fields)