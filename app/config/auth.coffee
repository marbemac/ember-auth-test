App.Auth = Em.Auth.extend
  modules: ['emberData','authRedirectable','actionRedirectable','rememberable']
  emberData:
    userModel: 'user'
  request: 'jquery'
  response: 'json'
  strategy: 'token'
  tokenKey: 'authToken'
  tokenLocation: 'param'
  tokenIdKey: 'userId'
  # session: 'local-storage'
  session: 'cookie'
  signInEndPoint: '/users/session'
  signOutEndPoint: '/users/session'
  actionRedirectable:
    signInRoute: 'me'
    signOutRoute: 'index'
    signOutSmart: true
    signOutBlacklist: [
      'me'
    ]
  authRedirectable:
    route: 'index'
  rememberable:
    tokenKey: 'rememberToken'
    period: 7
    autoRecall: true

module.exports = App.Auth
