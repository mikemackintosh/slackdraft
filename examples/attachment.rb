#!/usr/bin/env ruby
# coding: utf-8

require 'slackdraft'

# Set URL
url = "https://hooks.slack.com/services/xxxxxxxxxx"

# Create instance
attachment = Slackdraft::Attachment.new url

attachment.text = "Test"
attachment.username = "johndoe"
attachment.channel = "#slackdraft"

attachment.fallback    = "Fallback text!!!!"
attachment.color = "#439FE0"
attachment.pretext ="Hmm where?"

attachment.author_name = "Mike"
attachment.author_link = "https://github.com/mikemackintosh"
attachment.author_icon = ":skull:"

attachment.title =  "By Mike Mackintosh"
attachment.title_link = "https://github.com/mikemackintosh"

attachment.message = "This is pretty cool"

attachment.add_field("col 1", "blahblahblah")
attachment.add_field("col 2", "derpherp")

# Send it, and check response
if attachment.send!
  Slackdraft::success("Message successful")
end