
###
Module dependencies.
###
express = require("express")
pkg = require("../../package.json")

module.exports = (app, config, passport) ->
  app.set "showStackError", true

  # should be placed before express.static
  app.use express.compress(
    filter: (req, res) ->
      /json|text|javascript|css/.test res.getHeader("Content-Type")

    level: 9
  )
  app.use express.favicon()
  app.use express.static(config.root + "/public")

  # don't use logger for test env
  app.use express.logger("dev")  if process.env.NODE_ENV isnt "test"

  # set views path, template engine and default layout
  app.set "views", config.root + "/server/views"
  app.set "view engine", "jade"
  app.configure ->

    # expose package.json to views
    app.use (req, res, next) ->
      res.locals.pkg = pkg
      next()


    # cookieParser should be above session
    app.use express.cookieParser()

    # bodyParser should be above methodOverride
    app.use express.bodyParser()
    app.use express.methodOverride()

    # routes should be at the last
    app.use app.router

    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }))  if process.env.NODE_ENV is "development"
