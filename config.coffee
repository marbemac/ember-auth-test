sysPath = require 'path'

environment = process.env.BRUNCH_ENV ? 'development'
useMin = environment == 'development' ? '' : '.min'

console.log "Running Brunch in #{environment} environment"

exports.config =
  paths:
    watched: ['app', 'test', 'vendor', 'config']
  files:
    javascripts:
      joinTo:
        'javascripts/app.js':
          new RegExp("^(app|config/environments/#{environment}\.coffee)")
        'javascripts/vendor.js':
          new RegExp("^bower_components/")
      order:
        before: [
          "bower_components/jquery/jquery.js"
          "bower_components/handlebars/handlebars.js"
          "bower_components/ember/ember#{useMin}.js"
          "bower_components/ember-data-shim/ember-data#{useMin}.js"
          "bower_components/ember-auth/dist/ember-auth.min.js"
          # Anything else that depends on Ember
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /app\/styles\/app.styl/

    templates:
      precompile: true
      root: 'templates'
      joinTo: 'javascripts/app.js' : /^app/

  # allow _ prefixed templates so partials work
  conventions:
    ignored: (path) ->
      startsWith = (string, substring) ->
        string.indexOf(substring, 0) is 0
      sep = sysPath.sep
      if path.indexOf("app#{sep}templates#{sep}") is 0
        false
      else
        startsWith sysPath.basename(path), '_'

  overrides:
    production:
      optimize: true
      sourceMaps: false
      plugins: autoReload: enabled: false
