# Check the user's location
Template.splash.rendered = ()->
  $('body').addClass('colored-body')
  $('.splash-invite-success').hide()
  $('html').addClass('fill-height')
  $('body').addClass('fill-height')
  loc = Geolocation.currentLocation() #Get location, just so that maybe the user will approve it...

Template.splash.events
  'click #invite-request-btn': (e)-> _requestInvite(e)

_requestInvite = (e)->
  e.preventDefault()
  params = {}
  params.email = $('[name="email"]').val()
  loc = Geolocation.currentLocation()
  coords = Geolocation.latLng(coords)
  geo = CollectionUtils.initGeojson(coords)
  params.geo = geo if geo?
  console.log 'par', params, params.geo.geometry
  Invites.insert params, _inviteResponse()

_inviteResponse = (err, _id)->
  if err
    Helpers.throwError(err.reason) 
  else
    _showInviteSuccess()

_showInviteSuccess = ()->
  $('.splash-header-tiny-link').fadeOut(1000)
  $('.splash-inputs').fadeOut 1000, ()->
    $('.splash-inputs').hide()
    $('.splash-invite-success').fadeIn(1000)

