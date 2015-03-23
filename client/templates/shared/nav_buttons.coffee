Template.navButtons.helpers
  tribes: ()->
    user = Meteor.users.findOne()
    tribeIds = user.profile.tribeIds
    q = {_id: {$in: tribeIds} }
    return Tribes.find(q)