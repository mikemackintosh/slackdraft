require 'rspec/core'

require File.join(File.dirname(__FILE__), '..', 'lib', 'slackdraft')

# Seems to run tests more than once if we do RSpec.configure more than once
#unless RSpec.configuration.color_enabled == true
  RSpec.configure do |config|
    config.color = true
    config.formatter = :documentation
  end
#end