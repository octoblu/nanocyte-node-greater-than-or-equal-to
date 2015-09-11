class GreaterThanOrEqualToNode
  constructor: (@config, @data) ->
  onMessage: (message, callback=->) =>
    return callback null unless @config.left >= @config.right
    callback null, message

module.exports = GreaterThanOrEqualToNode
