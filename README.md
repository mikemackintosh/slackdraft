# slackdraft
Simplest way to send messages to Slack.

![TravisCI](https://travis-ci.org/mikemackintosh/slackdraft.svg)

# Installation

Like any other gem:

    gem install slackdraft


# Ruby Usage

Usage is very simple:

    require 'slackdraft'
    url = "https://slack/webhook/url"
    slack = Slackdraft::Message.new(url)
    
    # Url of the icon or emoji
    # slack.icon_url    = "https://..."
    slack.icon_emoji  = ":fire:"
    
    # Set the bot username
    slack.username    = "SlackDraft"
    
    # Set the channel
    slack.channel     = "#general"
    
    # Set text
    slack.text         = "Your message here! _*And can have* formatting_"
    
    # Or you can pass text in as an array
    # slack.text        = ["Your message here!", ">_*And can have* formatting_"]

    # Send the message
    slack.send!
      #-> true/false

For more examples, see the `examples/` directory.

# Command-line Usage

It's dumb simple. Instead of using `curl`, use this:

    slackdraft -u mike \
        -c "#slackdraft" \
        -m "This is our *formammted message*" \
        https://hooks.slack.com/services/xxxxxxx

> **Note**: The CLI version does not support Slack Attachments

## Help text

    $ slackdraft -h
    Usage: slackdraft [options] url

    Slack with less Kurt Russell

    v0.7.7

    Options:
        -h, --help                       Show command line help
            --version                    Show help/version info
        -c, --channel CHANNEL            Channel to send message to
        -u, --username USER              User to send message as
        -m, --message MESSAGE            Message to send
        -e, --emoji EMOJI                Emoji to prefix message with
        -i, --icon ICON                  Icon to prefix message with
