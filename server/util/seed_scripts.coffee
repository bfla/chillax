Meteor.startup ()->
  # if Meteor.users.find().limit(1).count is 0
  seedUsers() unless Meteor.users.findOne()
  seedTribes() unless Tribes.findOne()
  # seedCheckins() if Meteor.users.findOne() and !Checkins.findOne()
  # seedFriendLists() if Meteor.users.findOne() and !FriendLists.findOne()
  # seedMessages() if Meteor.users.findOne() and !Messages.findOne()
  # seedNotifications() if Meteor.users.findOne() and !Notifications.findOne()

# seedFriendLists = ()->
#   user = Meteor.users.findOne()
#   otherUser = Meteor.users.findOne({_id: {$ne: user._id}})

#   friendList =
#     userId: user._id
#     listType: 'besties' #['besties', 'new friends', 'facebook', 'second degree', 'all contacts']
#     friendIds: [otherUser._id]
#     createdAt: new Date()
#     updatedAt: new Date()

#   Factory.define 'friendList', FriendLists, friendList

#   otherFriendList =
#     userId: otherUser._id
#     listType: 'new friends'
#     friendIds: [user._id]

#   Factory.define 'otherFriendList', FriendLists, Factory.extend('friendList', otherFriendList)

#   console.log 'Seeding friendList data...'
#   Factory.create('friendList')
#   Factory.create('otherFriendList')

#   listTypes = ['besties', 'new friends', 'facebook', 'second degree', 'all contacts']
#   _.each _.omit(listTypes, friendList.listType), (listType)-> 
#     list = Factory.build('friendList')
#     list.listType = listType
#     FriendLists.insert(list)

#   _.each _.omit(listTypes, friendList.listType), (listType)->
#     list = Factory.build('otherFriendList')
#     list.listType = listType
#     FriendLists.insert(list)

# seedCheckins = ()->
#   user = Meteor.users.findOne()
#   otherUser = Meteor.users.findOne({_id: {$ne: user._id}})
  
#   checkin =
#     userId: user._id
#     message: 'Open Mic Night Ark @7pm'
#     publishedStatus: 'down to chill'
#     targetAudience: 'besties'
#     tribeIds: (user.tribeIds || [])
#     geoJson: user.profile.lastPosition
#     createdAt: new Date()
#     updatedAt: new Date()
#   Factory.define 'checkin', Checkins, checkin

#   otherCheckin =
#     userId: otherUser._id
#     message: 'Getting high with Plato'
#     tribeIds: (otherUser.tribeIds || [])
#   Factory.define 'otherCheckin', Checkins, Factory.extend('checkin', otherCheckin)

#   console.log "Seeding checkin data..."
#   Factory.create('checkin')
#   Factory.create('otherCheckin')