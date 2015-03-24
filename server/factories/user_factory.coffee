geojson =
  type:'Feature'
  geometry:
    type: 'Point'
    coordinates: [-83.7483, 42.2814]
    properties: { updatedAt: new Date() }

# Configure Facebook credentials
Factory.define 'user', Meteor.users,
  createdAt: new Date()
  profile:
    firstName: "Brian"
    publicStatus: 'down to chill'
    targetAudience: 'besties'
    tribeIds: []
  services:
    facebook:
      accessToken: "CAAIoZAP70gQYBADTuxOKzTYZAgQF55CaGEBITEvGTLJOrspVF2MNCawcJy1gRJVnyd7A5ZBBmshi1DzUPJm75DQNJ8zyfb5f0IbZC0v6Sr13zZC1H220XO7bTqQSg8waL1SKOnoitswSjll86ZCAyeyqZAr5kdS3znnQPZBbPV7QZAbaZBGSvm01Ws3l5aO2c3mfJXIhhOoyB4vsHZBYk4NJB8ZC"
      expiresAt: 1426095976050
      id: "10104724427825583"
      email: "bfla@umich.edu"
      name: "Brian Flaherty"
      first_name: "Brian"
      last_name: "Flaherty"
      link: "https://www.facebook.com/app_scoped_user_id/10104724427825583/"
      gender: "male"
      locale: "en_US"
    resume:
      loginTokens: [
        when: new Date()
        hashedToken: "v5btdQ1eH1cfihVPt3BsXaaKr2FVUZdXr8G2sQ47zq4="
      ]
  lastLocation: geojson
  friendLists:
    besties: []
    newPeople: []
    facebookFriends: []
    contacts: []

Factory.define 'otherUser', Meteor.users,
  createdAt: new Date()
  profile:
    firstName: "Plato"
    publicStatus: 'down to chill'
    targetAudience: 'besties'
    tribeIds: []
  services:
    facebook:
      accessToken: "CAAIoZAP70gQYBAL9zMFJpqmqZBPrW0ZAyIMkNhSXtjmTjrpXGrJpHYvf4uXDD15fMyodiqMRZAHzQX2ZBxJtmlp0JXI61Aselt1gLWlGoN611wSoAuZBQbZBMwOM2mwJGDVZAZCsNTm6YBJZBFJHutCZBDgsOywuH4RBuBdNAZCMidQJD7CrCCcJQClsYngGwAAr6gdIZAKmoEDqiTluYMI7b5l82"
      expiresAt: 1426096995822
      id: "1617711891785708"
      email: "brian@getcamphero.com"
      name: "Lou Salome"
      first_name: "Lou"
      last_name: "Salome"
      link: "https://www.facebook.com/app_scoped_user_id/1617711891785708/"
      gender: "female"
      locale: "en_US"
    resume:
      loginTokens: [
        when: new Date()
        hashedToken: "FsZmlgxV7OhjUuk4JuO1O9mW6Y3Blrg/4YEF3QzVzWc="
      ]
  lastLocation: geojson
  friendLists:
    besties: []
    newPeople: []
    facebookFriends: []
    contacts: []

@seedUsers = () ->
  Factory.create('user')
  Factory.create('otherUser')
  if Meteor.users.count < 2 then console.log "Error: User factory failed to create users"

