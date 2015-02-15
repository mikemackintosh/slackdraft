#!/usr/bin/env ruby
# coding: utf-8

require 'slackdraft'

# Set URL
url = "https://hooks.slack.com/services/xxxxxxxxxx"

# Create instance
slack = Slackdraft::Attachment.new(url)
slack.fallback    = "Fallback text!!!!"
slack.color = "#439FE0"
slack.pretext ="Hmm where?"

slack.author_name = "Mike"
slack.author_link = "https://github.com/mikemackintosh"
slack.author_icon = ":skull:"

slack.title =  "By Mike Mackintosh"
slack.title_link = "https://github.com/mikemackintosh"

slack.text = "This is pretty cool"

slack.add_field("col 1", "blahblahblah")
slack.add_field("col 2", "derpherp")

# Send it, and check response
if slack.send!
  Slackdraft::success("Message successful")
end