Meteor.startup ()->
  # if Meteor.users.find().limit(1).count is 0
  seedUsers() unless Meteor.users.findOne()
  seedTribes() unless Tribes.findOne()
  # seedCheckins() unless Checkins.findOne()
  # seedFriendLists() unless FriendLists.findOne()
  # seedMessages() unless Messages.findOne()
  # seedNotifications() unless Notifications.findOne()