# Track the user's location and take appropriate action when it updates...
# Tracker.autorun () ->
#   if Meteor.user()
#     lastLocation = Geolocation.currentLocation()
#     locationErrors = Geolocation.error()
#     Session.set 'lastKnownLocation', lastLocation
#     unless locationErrors
#       if lastLocation?.coords?.latitude && lastLocation?.coords?.longitude
#         storeUserGeolocation(lastLocation)
#       console.log "Location: " + Session.get('lastKnownLocation')
#       Session.set 'locationErrors', locationErrors
#       console.log "Location Errors: " + Session.get('locationErrors')

# UserStatus.events.on "connectionLogin", (fields)->
#   storeUserGeolocation()

# UserStatus.events.on "connectionActive", (fields)->
#   storeUserGeolocation()

# # Save the user's location to their checkin object in the database
# storeUserGeolocation = () ->
#   return if Geolocation.error()
#   location = Geolocation.currentLocation()
#   if location?.coords?.latitude && location?.coords?.longitude
#     params = {}
#     params.latitude = location.coords.latitude
#     params.longitude = location.coords.longitude

#     Meteor.call 'updateUserLocation', params