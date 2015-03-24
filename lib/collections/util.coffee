@CollectionUtils = {}

CollectionUtils.initGeojson = ()->
  geojson =
    type: "Feature"
    geometry: 
      type: "Point"
      coordinates: []
      properties : {createdAt: new Date()}

CollectionUtils.dbCallback = (err, _id)->
  if err
    throw err
    return err
  else
    return _id

# @SharedSchemas = {}

# SharedSchemas.Geojson = new SimpleSchema
#   type:
#     type: String
#     allowedValues: ['Feature']
#   geometry: GeometrySchema

# GeometrySchema = new SimpleSchema
#   type:
#     type: String
#     allowedValues: ['Point']
#   coordinates:
#     type: [Number]
#     decimal: true
#     minCount: 2
#     maxCount: 2
#   properties: 
#     type: Object
#     optional: true

# CollectionUtils.allowedFriendshipTypes = ['besties', 'new friends', 'facebook', 'second degree', 'all contacts']