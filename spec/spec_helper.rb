require 'sergovia'
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # ...or explicitly enable both
    c.syntax = [:should, :expect]
  end
end
