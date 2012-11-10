require 'sandrbox'

Sandrbox.configure do |config|
  config.bad_constants << :Rails
  config.bad_constants << :ActiveRecord
end
