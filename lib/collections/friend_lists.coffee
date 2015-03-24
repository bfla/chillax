@FriendLists = new Mongo.Collection('friendLists')

FriendListSchema = new SimpleSchema
  userId:
    type: String
  listType:
    type: String
    allowedValues: ['besties', 'new friends', 'facebook', 'second degree', 'all contacts']
  friendIds:
    type: [String]
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    defaultValue: new Date()
FriendLists.attachSchema(FriendListSchema)

FriendLists.allow
  insert: ()-> false
  update: (userId, friendList)-> Permissions.userOwnsDoc(userId, friendsList)
  remove: ()-> false

FriendLists.deny # Only friendIds are editable
  update: (userId, friendList, fieldNames)-> _.without(fieldNames, 'friendIds').length > 0

Meteor.methods
  createFriendList: (params)->
    post = params
    post.userId = Meteor.userId()
    post.createdAt = new Date()
    post.updatedAt = new Date()

    Tribes.insert post, CollectionUtils.dbCallback()