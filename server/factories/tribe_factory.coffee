_defaultTribes = [
  {name: 'playing music', category:'creators', description: 'For those who make music'}
  {name: 'consuming music', category:'creators', description: 'For those who love music.'}
  {name: 'making art', category: 'creators', description: 'For those who love making art and creating things.'}
  {name: 'crafting', category:'creators', description: 'For those who love making things: Crafts, hardware, etc.'}
  {name: 'developing web apps', category:'creators', description: 'For those who like coding cool stuff.'}
  {name: 'discussing books', category: 'analysts', description: 'For those who love books.'}
  {name: 'consciousness', category: 'analysts', description: 'For those interested in philosophy and theories.'}
  {name: 'human nature', category: 'analysts', description: 'For those interested in psychology, peoplewatching, and human nature.'}
  {name: 'technologists', category:'analysts', description: 'For those who love technology and science.'}
  {name: 'adventures', category: 'doers', description: 'For those who love new adventures.'}
  {name: 'professional', category:'doers', description: 'For those who love what they do and value effectiveness.'}
  {name: 'foodies', category:'doers', description:'For those who love and appreciate the best food.'}
  {name: 'altruists', category:'doers', description: 'For those who love volunteering. causes, and helping others.'}
  {name: 'health and fitness enthusiasts', category:'doers', description: 'For interested in fitness and healthy eating.'}
  {name: 'starting ventures', category:'doers', description: 'For entrepreneurs and startup people.'}
]

tribe = _defaultTribes[0]
Factory.define('tribe', tribe)

@seedTribes = ()->
  console.log "Seeding tribe data..."
  _.each _defaultTribes, (tribe)-> Meteor.call('createTribe', tribe)
