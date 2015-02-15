module Slackdraft
  class Message < Slackdraft::Base
    
    # Attributes
    fattr username:   'slackdraft'
    fattr channel:    '#slackdraft'
    fattr icon_emoji: ':fire:'
    fattr icon_url:   ''
    fattr text:       ''

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

    # Set the icon URL and default to the emoji
    def icon_url
      @icon_url || icon_emoji
    end

    # Set the emoji
    def icon_emoji
      return ':fire:' if @icon_emoji.nil?
    end

    def refchannel(channel)
      "<#C024BE7LR|#{channel}>"
    end

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

    def generate_payload
        payload = {}
        payload[:channel]    = self.channel    unless self.channel.nil?
        payload[:username]   = self.username   unless self.username.nil?
        payload[:icon_url]   = self.icon_url   unless self.icon_url.nil?
        payload[:icon_emoji] = self.icon_emoji unless self.icon_emoji.nil?
        payload[:text]       = self.text       unless self.text.nil?

        payload
    end

    # Send the message!
    def send!
      
      # Send the request
      request = HTTParty.post(self.target, :body => {
        :payload => generate_payload.to_json
      })

      unless request.code.eql? 200
        false
      end

      true

    end
  end
end