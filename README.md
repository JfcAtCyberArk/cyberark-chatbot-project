# cyberark-chatbot-project

Chatbot that removes password from Slack channel(s).

## How to use it ? 

Add those files to your hubot project repository. 

Set required vars in vars.sh (default time before deletion is 5 seconds)

Update line 11 of cybr-bot.coffee with your own regex :  robot.hear /<regex>/i, (res) ->

It will allow you to only delete message matching your regex.

And then run 1-start.sh


## Useful links : 

http://slackapi.github.io/hubot-slack/

https://www.npmjs.com/search?q=keywords:hubot-scripts

https://hubot.github.com/docs/scripting/

https://api.slack.com/methods/chat.delete
