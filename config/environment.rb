# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SmApi::Application.initialize!

Riak.disable_list_keys_warnings = true
