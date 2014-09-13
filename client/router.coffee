### ROUTING ###

# Router main template
Router.configure
  layoutTemplate: 'layoutMain'
  # notFoundTemplate: 'fourZeroFour'
  # loadingTemplate: 'loading'
  # render the template named header to the 'header' yield
  # waitOn: null => the header has not to wait the subscriptions but has to be rendered immediately
  # yieldTemplates:
  #   'headerMain': {to: 'header', waitOn : null}
  #   'footerMain': {to: 'footer'}

# Router.onBeforeAction('dataNotFound')

# Define client routes
Router.map ->
  # Landing page
  @route 'indexRoute', path: '/', controller: 'IndexController'
  @route 'playersRoute', path: '/players', controller: 'PlayersController'
  @route 'matchRoute', path: '/match/:_id', controller: 'MatchController'

  @route 'matchListRoute', path: '/match', controller: 'MatchListController'
  @route 'profileRoute', path: '/u/:username', controller: 'ProfileController'
  @route 'leaderRoute', path: '/leaderboard', controller: 'LeaderController'

# Configure the progress bar
IronRouterProgress.configure
  spinner : false

console.log "Configured router, #{Router.routes.length} routes defined"
