module Slackdraft
  class Message < Slackdraft::Base

    # Attributes
    fattr username:   'slackdraft'
    fattr channel:    '#general'
    fattr icon_emoji: ':fire:'
    fattr icon_url:   ''
    fattr text:       ''
    fattr attachments: []

    # Set the api call username
    def username
      return 'slackdraft' if @username.nil?
      @username
    end

    # Set the destination channel
    def channel
      return '#general' if @channel.nil?
      @channel
    end

    # Add an attachment
    def add_attachment(attachment)
      self.attachments.push(attachment.to_h)
    end

    # Set the icon URL and default to the emoji
    def icon_url
      @icon_url || icon_emoji
    end

    # Set the emoji
    def icon_emoji
      return ':fire:' if @icon_emoji.nil?
    end

    # Reference a channel
    def refchannel(channel)
      "<#C024BE7LR|#{channel}>"
    end

    # Reference a user
    def refuser(user)
      "<@U024BE7LH|#{user}>"
    end

    # Set the text of the message
    def text
      
      if @text.kind_of?(Array)
        return @text.join("\n")
      end
      
      @text
    end

    # Generate the payload if stuff was provided
    def generate_payload
        payload = {}
        payload[:channel]     = self.channel    unless self.channel.nil?
        payload[:username]    = self.username   unless self.username.nil?
        payload[:icon_url]    = self.icon_url   unless self.icon_url.nil?
        payload[:icon_emoji]  = self.icon_emoji unless self.icon_emoji.nil?
        payload[:text]        = self.text       unless self.text.nil?
        payload[:attachments] = self.attachments unless self.attachments.empty?

        payload
    end

  end
end