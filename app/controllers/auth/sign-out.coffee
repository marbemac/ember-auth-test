App.AuthSignOutController = Em.Controller.extend
  actions:
    signOut: ->
      self = @
      @auth.signOut()
