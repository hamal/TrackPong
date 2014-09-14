###
  Layout & rendering for match
###

### ROUTING ###
class @MatchController extends RouteController
  template: 'matchMain'
  fastRender: true
  waitOn: ->
    Meteor.subscribe 'matchPub', @params._id
  data: ->
    match: Matches.findOne(_id: @params._id)

console.log "Router: configured #{MatchController.name}"

### RENDERED ###
Template.matchMain.rendered = ->
  if "WebSocket" of window
    iTmp = 0
    MatchController.lastTmp = []
    # MatchController.avgTmp = new ReactiveVar(0)
    iGsr = 0
    MatchController.lastGsr = []
    MatchController.avgGsr = new ReactiveVar(0)
    iBvp = 0
    MatchController.lastBvp = []
    MatchController.avgBvp = new ReactiveVar(0)

    console.log "WebSocket is supported by your Browser!"

    # Let us open a web socket
    MatchController.wsPlayerOne = new WebSocket("ws://127.0.0.1:22222", ["base64"])
    MatchController.wsPlayerOne.onopen = ->
      # Web Socket is connected, send data using send()
      MatchController.wsPlayerOne.send btoa("server_status\n")

    MatchController.wsPlayerOne.onmessage = (evt) ->
      received_msg = evt.data
      # console.log "Message is received..."
      # console.log atob(received_msg)
      splittedMessage = atob(received_msg).split(" ")
      # console.log splittedMessage
      switch splittedMessage[0]
        when 'T'
          tmp = splittedMessage[2][0...-2]
          # console.log tmp
          MatchController.lastTmp[iTmp++%10] = tmp
          Session.set 'avgTmpPlayerOne', average(MatchController.lastTmp)
          # MatchController.avgTmp.set(average(MatchController.lastTmp))
          # console.log MatchController.avgTmp
        when 'G'
          gsr = splittedMessage[2][0...-2]
          # console.log gsr
          MatchController.lastGsr[iGsr++%10] = gsr
          Session.set 'avgGsrPlayerOne', average(MatchController.lastGsr)
          # MatchController.avgGsr.set(average(MatchController.lastGsr))
          # console.log MatchController.avgGsr
        when 'B'
          bvp = splittedMessage[2][0...-2]
          # console.log bvp
          MatchController.lastBvp[iBvp++%10] = bvp
          Session.set 'avgBvpPlayerOne', average(MatchController.lastBvp)
          # MatchController.avgBvp.set(average(MatchController.lastBvp))
          # console.log MatchController.avgBvp
        when 'R'
          console.log splittedMessage
          if splittedMessage[1] is 'device_connect' and splittedMessage[2].indexOf('OK') is 0
            Session.set 'connectedOne', true

    MatchController.wsPlayerOne.onclose = ->
      # websocket is closed.
      console.log "Connection is closed..."
  else
    # The browser doesn't support WebSocket
    console.log "WebSocket NOT supported by your Browser!"

### EVENTS ###
Template.matchMain.events =
  'click #player-one-connect': ->
    # connect the device playerOne
    console.log Router.current().data().match.playerOne
    console.log Router.current().data().match.deviceIdOne
    MatchController.wsPlayerOne.send(btoa("device_connect #{Router.current().data().match.deviceIdOne}\n"))
    MatchController.wsPlayerOne.send(btoa("device_subscribe tmp ON\n"))
    MatchController.wsPlayerOne.send(btoa("device_subscribe gsr ON\n"))
    MatchController.wsPlayerOne.send(btoa("device_subscribe bvp ON\n"))
  # 'click .buttonMinusLeft': ->
  #   Matches.update(Router.current().data().match._id, $inc: scoreOne: -1)
  'click .buttonPlusLeft': ->
    Matches.update(Router.current().data().match._id, $inc: scoreOne: 1)
  'click .buttonPlusRight': ->
    Matches.update(Router.current().data().match._id, $inc: scoreTwo: 1)

### HELPERS ###
Template.matchMain.helpers
  avgTmpPlayerOne: -> Session.get('avgTmpPlayerOne') / 38 * 70
  avgGsrPlayerOne: -> Session.get('avgGsrPlayerOne') / 30 * 70
  avgBvpPlayerOne: -> Math.abs(Session.get('avgBvpPlayerOne')) / 90 * 70
  avgTmpPlayerTwo: -> Session.get('avgTmpPlayerOne') / 38 * 70 * getRandomArbitrary(0.8, 1.1)
  avgGsrPlayerTwo: -> Session.get('avgGsrPlayerOne') / 30 * 70 * getRandomArbitrary(0.8, 1.1)
  avgBvpPlayerTwo: -> Math.abs(Session.get('avgBvpPlayerOne')) / 90 * 70 * getRandomArbitrary(0.8, 1.1)
  secretFormula: -> - Session.get('avgTmpPlayerOne') / 37 * 70 + 100
  connectedOne: -> Session.get 'connectedOne'


average = (array) ->
  # console.log array
  if array.length == 0
    return 0
  reduceFunc = (memo, num) -> memo + parseFloat(num)
  (_.reduce(array, reduceFunc, 0) / array.length).toPrecision(4)

getRandomArbitrary = (min, max) ->
  Math.random() * (max - min) + min;
