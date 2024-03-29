Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'
  waitOn: ()-> [Meteor.subscribe('listTribes'), Meteor.subscribe('user')]

# Index route ==========================================================================================
Router.route '/',
  name: 'home'
  template: 'splash'
  layoutTemplate: 'nakedLayout'
  # template: 'editCheckin'
  # waitOn: ()-> [Meteor.subscribe('checkin')]

# Router.route '/editCheckin',
#   name: 'editCheckin'
#   template: 'editCheckin'
#   waitOn: ()-> [Meteor.subscribe('checkin')]


# Local tribe route ====================================================================================
# Router.route '/tribes/:_id',
#   template: 'showTribe'
#   name: 'tribe'
#   waitOn: ()-> 
#     postsParams =
#       tribeId: @params._id
#       longitude: UserMethods.getUserLongitude() || -83.7483 #-83.7483 #redFlag this.params.query.longitude
#       latitude: UserMethods.getUserLatitude() || 42.2814 #42.2814 #redFlag this.params.query.latitude
#     [Meteor.subscribe('tribe', @params._id), Meteor.subscribe('postsForTribe', postsParams)]
#   data: ()-> 
#     data =
#       tribe: Tribes.findOne(@params._id)
#       posts: Posts.find({tribeId: @params._id})

# User tribe selection route ==========================================================================
Router.route '/joinTribes',
  template: 'joinTribes'
  name: 'joinTribes'
  waitOn: ()-> Meteor.subscribe('listTribes')
  data: ()-> Tribes.find()



# Helpers ================================================================================

# requireLogin = () ->
#   if !Meteor.userId()
#     if Meteor.loggingIn()
#       @render(@loadingTemplate)
#     else
#       @render('splash') #redFlag -- add splash page
#   else
#     this.next()

# requireTribeSelection = ()->
  # if 

# Require login before doing stuff!
# Router.onBeforeAction ()-> requireLogin()

