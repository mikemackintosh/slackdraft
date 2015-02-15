# slackdraft
Simplest way to send messages to Slack.

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
