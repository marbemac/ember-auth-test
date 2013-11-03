env = process.env.NODE_ENV or "development"

###
Module dependencies.
###
express = require("express")

###
Main application entry file.
Please note that the order of loading is important.
###

app = express()

# Load configurations
config = require("./server/config/config")[env]

# express settings
require("./server/config/express") app, config

# Bootstrap routes
require("./server/config/routes") app

# Start the app by listening on <port>
port = process.env.PORT or 8000
app.listen port
console.log "Express app started on port " + port

# expose app
exports = module.exports = app
