time = process.env.HUBOT_EXPIRATION_TIME or 5
oauth_token = process.env.HUBOT_OAUTH_TOKEN
token_string = 'Bearer'+' '+oauth_token
default_url = "https://slack.com/api/chat.delete"

module.exports = (robot) ->

  robot.hear /password/i, (res) ->
    res.send "Sharing credentials in cleartext is a bad practice. Message will be removed in #{time} second(s) "

  robot.hear /password|SSH_KEY|^pw|AWS_SECRET_KEY/i, (res) ->
    setTimeout () ->
      data = JSON.stringify({
        channel: res.message.room,
        ts: res.message.id
      })
      robot.http("#{default_url}")
        .header('Content-Type', 'application/json')
        .header('Authorization', "#{token_string}")
        .post(data) (err, msg, body) ->
          if err
            res.send "Encountered an error :( #{err})"
            return
          else
            res.send "Credentials have been removed"
    , time * 1000
    
