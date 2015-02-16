require 'rspec/core'

require File.join(File.dirname(__FILE__), '..', 'lib', 'slackdraft')

# Create the share API context
# so we can pass stuff between
# the different tests
RSpec.shared_context "shared environment", :a => :b do

  before(:all) do

    # Set webhook token
    @slackhook = 'blahblahblah'

  end

end

# Seems to run tests more than once if we do RSpec.configure more than once
#unless RSpec.configuration.color_enabled == true
  RSpec.configure do |config|
    config.color = true
    config.formatter = :documentation
  end
#end