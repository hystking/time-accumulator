# Simple time accumulator with no blocking

## example
```coffeescript
accumulator = new TimeAccumulator step: 16

update = ->
  # write update process

do step = (timestamp) ->
  accumulator.accumulate update, timestamp
  requestAnimationFrame step


```
