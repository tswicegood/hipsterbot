# Need some Popcorn?
#
# popcorn - Get some popcorn for the show on IRC

module.exports = (robot) ->

  robot.respond /how many popcorns are there/i, (msg) ->
    msg.http("https://gimmebar.com/api/v1/public/assets/tswicegood/popcorn.json")
      .get() (err, res, body) ->
        data = JSON.parse body
        msg.send "there are #{data.records.length} popcorns"

  robot.respond /popcorn/i, (msg) ->
    msg.http("https://gimmebar.com/api/v1/public/assets/tswicegood/popcorn.json")
      .get() (err, res, body) ->
        data = JSON.parse body
        rand = Math.floor(Math.random() * data.records.length)
        msg.send data.records[rand].content.original_url
