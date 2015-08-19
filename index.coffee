module.exports = class
  constructor: ({@step}) ->
    @timestamp = 0

  accumulate: (callback, timestamp) ->
    while @timestamp < timestamp
      setTimeout callback, 0
      @timestamp += @step
    return
