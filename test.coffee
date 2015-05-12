test = require "prova"
TimeAccumulator = require "./index.coffee"

STEP = 16

accumulator = new TimeAccumulator
  step: STEP

called = 0
update = ->
  called++

step = (timestamp) ->
  accumulator.accumulate update, timestamp
  requestAnimationFrame step

test "runs correctly", (t) ->
  t.plan 5
  requestAnimationFrame step
  start = performance.now()

  setTimeout ->
    expect = 1 + (performance.now() - start) / STEP | 0
    t.ok  expect * .8 < called < expect * 1.2
  , 1000

  setTimeout ->
    expect = 1 + (performance.now() - start) / STEP | 0
    t.ok  expect * .8 < called < expect * 1.2
  , 2000
  setTimeout ->
    expect = 1 + (performance.now() - start) / STEP | 0
    t.ok  expect * .8 < called < expect * 1.2
  , 3000
  setTimeout ->
    expect = 1 + (performance.now() - start) / STEP | 0
    t.ok  expect * .8 < called < expect * 1.2
  , 4000

  setTimeout ->
    expect = 1 + (performance.now() - start) / STEP | 0
    t.ok  expect * .8 < called < expect * 1.2
  , 5000
  
