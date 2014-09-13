# Instantiate Players collections
@Players = new Mongo.Collection 'players'

### CLIENT AUTHORZATIONS ###
Players.allow
  insert: (userId, doc) ->
    true
  # update: (userId, doc, fields, modifier) ->
  #   true
