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

  end
end