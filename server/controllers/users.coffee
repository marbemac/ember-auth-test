###
Session Dummy
###
exports.createSession = (req, res, next) ->
  res.send 201,
    authToken: '123'
    userId: 1
    rememberToken: "456"



###
Session
###
exports.destroySession = (req, res, next) ->
  res.send
    authToken: '123'
    userId: 1


exports.show = (req, res, next) ->
  res.send
    user:
      id: 1
      username: 'marc'
      email: 'foo@email.com'
