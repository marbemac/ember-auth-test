###
Controllers
###
pages = require("../controllers/pages")
users = require("../controllers/users")

###
Expose routes
###
module.exports = (app, passport) ->

  # user routes
  app.post "/users/session", users.createSession
  app.delete "/users/session", users.destroySession
  app.get "/users/:id", users.show
  app.get "/secret", pages.home
  app.get "/", pages.home
