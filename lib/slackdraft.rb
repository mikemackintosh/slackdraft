require 'httparty'
require 'json'
require 'cgi'

require 'slackdraft/version'
#require 'slackdraft/attachment'
#require 'slackdraft/message'

module Slackdraft
  class Message
    
    # Attributes
    attr_writer :username
    attr_writer :channel
    attr_writer :icon_url
    attr_writer :icon_emoji
    attr_writer :text

    # Init the class
    def initialize(url)
      @webhookuri = url
    end

    # Set the api call username
    def username
      @username ||= 'slackdraft'
    end

    # Set the destination channel
    def channel
      @channel || '#general'
    end

    # Set the icon URL and default to the emoji
    def icon_url
      @icon_url || icon_emoji
    end

    # Set the emoji
    def icon_emoji
      @icon_emoji || ':fire:'
    end

    # Set the text of the message
    def text
        @text.join("\n")
        puts @text
    end

    # Send the message!
    def send!

      puts @channel
      puts @username

      request = HTTParty.post(@webhookuri, :body => {
        :payload => {
          :channel => @channel,
          :username => @username,
          :text => @text,
          :icon_emoji => @icon_emoji,
        }.to_json
      })

      puts request.code
      puts request.body
    end

  end

  class Attachment
    attr_writer :fallback
    attr_writer :text
    attr_writer :pretext
    attr_writer :color
    attr_writer :fields

    def initialize

    end

  end
end