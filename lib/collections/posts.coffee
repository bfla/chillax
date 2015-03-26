# @Posts = new Mongo.Collection('posts')

# PostSchema = new SimpleSchema
#   userId:
#     type: String
#   tribeId:
#     type: String
#   text:
#     type: String
#   geoJson:
#     type: Object
#     optional: true # redFlag - because it was throwing mysterious errors
#     # type: SharedSchemas.Geojson
#   createdAt:
#     type: Date
#   updatedAt:
#     type: Date
# Posts.attachSchema(PostSchema)

# Posts.allow
#   insert: ()-> true
#   update: ()-> true
#   remove: ()-> false

# Posts.deny
#   insert: (params)-> _.without(params, 'email', 'geo').length > 0
#   update: ()-> true
#   remove: ()-> true

# Meteor.methods
#   createPost: (params)->
#     post = params
#     post.userId = Meteor.userId()
#     post.createdAt = new Date()
#     post.updatedAt = new Date()

#     Tribes.insert post, CollectionUtils.dbCallback()