#!/usr/bin/env ruby
lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# TODO: Change color based on alert type

# Require Slackdraft
require 'slackdraft'

# Set the webhook
WEBHOOK = ENV['SLACK_EP'] ||= "https://...."

# Create instance
slack = Slackdraft::Message.new WEBHOOK

slack.text = "Calling out to @mike. Does it work?"
slack.username = "johndoe"
slack.channel = "#slackdraft"

# Send it, and check response
if slack.send!
  Slackdraft::success("Message successful")
end