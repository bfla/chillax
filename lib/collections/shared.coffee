@CollectionUtils = {}

CollectionUtils.initGeojson = ()->
  geojson =
    type: "Feature"
    geometry: 
      type: "Point"
      coordinates: []
      properties : {}


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

CollectionUtils.dbCallback = (err, _id)->
  if err
    throw err
    return err
  else
    return _id