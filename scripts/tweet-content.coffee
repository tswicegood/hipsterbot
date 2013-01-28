# detect tweet URL and send tweet content
module.exports = (robot) ->
  robot.hear /https?:\/\/(mobile\.)?twitter\.com\/.*?\/status\/([0-9]+)/i, (msg) ->
    msg.http("https://api.twitter.com/1/statuses/show/#{msg.match[2]}.json").get() (err, res, body) ->
      return if err or (res.statusCode != 200)

      tweet = JSON.parse(body)

      name = "#{tweet.user.screen_name}"
      name += " (#{tweet.user.name})" unless tweet.user.screen_name is tweet.user.name
      msg.send "@#{name}: #{tweet.text}"
