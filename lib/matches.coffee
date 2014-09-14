# Instantiate Matches collections
@Matches = new Mongo.Collection 'matches'

### CLIENT AUTHORZATIONS ###
Matches.allow
  update: (userId, doc, fields, modifier) ->
    true
