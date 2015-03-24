Meteor.startup ()->
  seedUsers() unless Meteor.users.findOne()
  seedTribes() unless Tribes.findOne()