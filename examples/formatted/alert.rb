#!/usr/bin/env ruby
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# TODO: Change color based on alert type

# Require Slackdraft
require 'slackdraft'

# Set the webhook
WEBHOOK = ENV['SLACK_EP'] ||= "https://...."

# Create instance
slack = Slackdraft::Format::Alert.new WEBHOOK

# Username to send message as
slack.username = "MikeMackintosh"

# Where to send alert to
slack.channel = "#slackdraft"

# Service that is alerting
slack.service = "Slack Communications"

# Header message (smaller text)
slack.header = "New Alert Received!"

# Alert message
slack.alert = "Shit is going down"

# Severity
slack.severity = 4

# Name and link to originator bot
slack.bot = "SlackDraft Alert"
slack.botlink = "http://github.com/mikemackintosh"

# Add a link here to your runbook/wiki on how to fix
slack.runbook = "https://github.com/mikemackintosh"

# Send it, and check response
if slack.send!
  Slackdraft::success("Message successful")
end
