require 'spark_api'
require_relative 'settings.rb'

# use OAuth token
SparkApi.configure do |config|
  config.authentication_mode = SparkApi::Authentication::OAuth2
end

# create session
SparkApi.client.session = SparkApi::Authentication::OAuthSession.new({ :access_token => Settings.oauth_token })

# get listing id from command line
file = ARGV[0] || "20070627211337300206000000"

# get listing
listing = SparkApi.client.get "/listings/#{file}"

# write listing to file
output = File.open("listing.txt", "w")
output.write(listing)
output.close