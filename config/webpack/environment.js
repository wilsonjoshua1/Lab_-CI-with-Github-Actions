const { environment } = require('@rails/webpacker')

environment.entry = {
    application: './app/javascript/packs/application.js'
  }
module.exports = environment
