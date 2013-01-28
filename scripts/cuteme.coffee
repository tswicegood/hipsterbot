# Cuteme is the most important thing in your life
#
# cute - Receive a cuteness
# cute bomb N - get N cuteness

cute_gif = "http://i.imgur.com/9v5L5.gif"
module.exports = (robot) ->
  robot.respond /cute/i, (msg) ->
    msg.send cute_gif

  robot.respond /cute bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    msg.send cute_gif for i in [1..count]
