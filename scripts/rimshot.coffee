module.exports = (robot) ->
  robot.respond /rimshot/i, (msg) ->
    msg.send "http://instantrimshot.com/"
