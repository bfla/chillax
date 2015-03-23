@Permissions = {}

#check that the userId specified owns the documents
Permissions.ownsDocument = (userId, doc)-> 
  return doc and doc.userId is userId