module Slackdraft

  class Attachment < Base

    fattr fallback: "This message was sent with Slackdraft"
    fattr color: "#439FE0"
    fattr pretext: ""

    fattr author_name: ""
    fattr author_link: ""
    fattr author_icon: ""

    fattr title: ""
    fattr title_link: ""

    fattr text: ""
    fattr fields: []

    fattr image_url: ""

    def add_field(title, value, short=false)
        fields.push({:title => title, :value => value, :short => short })
    end

    def generate_payload
        payload = {}
        payload[:fallback]    = self.fallback    unless self.fallback.nil?
        payload[:color]       = self.color       unless self.color.nil?
        payload[:pretext]     = self.pretext     unless self.pretext.nil?
        payload[:author_name] = self.author_name unless self.author_name.nil?
        payload[:author_link] = self.author_link unless self.author_link.nil?
        payload[:author_icon] = self.author_icon unless self.author_icon.nil?
        payload[:title]       = self.title       unless self.title.nil?
        payload[:title_link]  = self.title_link  unless self.title_link.nil?
        payload[:text]        = self.text        unless self.text.nil?
        payload[:fields]      = self.fields      unless self.fields.nil?
        payload[:image_url]   = self.image_url   unless self.image_url.nil?

        payload
    end

    # Send the message!
    def send!

      payload = 
      
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