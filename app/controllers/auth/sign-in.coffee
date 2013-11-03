App.AuthSignInController = Em.Controller.extend
  login: null
  password: null
  error: false

  actions:

    signIn: ->
      self = @
      @set 'error', false

      @auth.signIn
        data:
          login:    self.get 'login'
          password: self.get 'password'
          remember: true

      .then (response) ->
        console.log 'signed in!'
        console.log self.auth.get('user')
        self.set('error', false)

      .fail ->
        console.log 'sign in failed'
        self.set('error', true)
