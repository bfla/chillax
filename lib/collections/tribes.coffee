@Tribes = new Mongo.Collection('tribes')

TribeSchema = new SimpleSchema
  name:
    type: String
  category:
    type: String
    allowedValues: ['creators', 'analysts', 'doers']
  description:
    type: String
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    defaultValue: new Date()
Tribes.attachSchema(TribeSchema)

Tribes.allow
  insert: ()-> false
  update: ()-> false
  remove: ()-> false

Tribes.deny
  insert: ()-> true #_.without(params, '').length > 0
  update: ()-> true #_.without(params, '').length > 0

