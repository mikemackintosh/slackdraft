module Slackdraft

  class Attachment < Slackdraft::Message

    fattr fallback: "This message was sent with Slackdraft"
    fattr color:    "#439FE0"
    fattr pretext:  nil

    fattr author_name: nil
    fattr author_link: nil
    fattr author_icon: nil

    fattr title:      nil
    fattr title_link: nil

    fattr text:       nil
    fattr fields:     []

    fattr image_url:  nil

    # Capture the url if we pass it in
    def initialize(url=nil)
      unless url.nil?
        @target = url
      end
    end

    # Short defines if it's 1 column or not, default: not
    def add_field(title, value, short=true)
        fields.push({:title => title, :value => value, :short => short })
    end

    # Generate the payload for slack attachments
    def generate_attachment
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
        
        unless self.fields.nil?
            payload[:fields]      = self.fields if self.fields.length > 0
        end

        payload[:image_url]   = self.image_url   unless self.image_url.nil?

        payload
    end

    # To hash, for use in Message
    def to_h
        generate_attachment
    end

    # Send it directly from Attachment
    def send!
        add_attachment(generate_attachment)
        super
    end

  end

end