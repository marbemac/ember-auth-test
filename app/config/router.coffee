App.Router = Ember.Router.extend() # ensure we don't share routes between all Router instances

App.Router.reopen
  location: 'history'

App.Router.map ->
  @route 'secret', path: '/secret'

module.exports = App.Router
