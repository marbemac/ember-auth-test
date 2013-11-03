attr = DS.attr

App.User = DS.Model.extend

  name: attr()
  email: attr()

module.exports = App.User
