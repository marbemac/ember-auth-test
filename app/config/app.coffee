Environment = require 'config/environment'
env = Environment.create()

options =
  rootElement: "#app-container"

if env.get('isDevelopment')
  options['LOG_TRANSITIONS'] = true
  options['LOG_TRANSITIONS_INTERNAL'] = false
  options['LOG_STACKTRACE_ON_DEPRECATION'] = true
  options['LOG_BINDINGS'] = true
  options['LOG_VIEW_LOOKUPS'] = true
  options['LOG_ACTIVE_GENERATION'] = true

  # From http://git.io/HPjymw
  Ember.RSVP.configure 'onerror', (e) ->
    console.log 'error! :/'
    console.log(e.message)
    console.log(e.stack)

  Ember.debug("Running in #{env.get('name')} environment")

module.exports = Ember.Application.create(options)
