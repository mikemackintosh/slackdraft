module Slackdraft
  class Base
    
    fattr endpoint: 'https://hooks.slack.com/services/'

    # Init the class
    def initialize(token, &block)
      if /^https?/.match(token)
        @target = token
      else 
        @target = "#{self.endpoint}#{@token}"
      end

      instance_eval(&block) if block_given?
    end

    def target
      @target
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