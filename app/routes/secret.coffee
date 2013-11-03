App.SecretRoute = Ember.Route.extend
  model: -> @get('store').find('user', 1)

module.exports = App.SecretRoute
