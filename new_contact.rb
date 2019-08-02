require 'spark_api'
require_relative 'settings.rb'

# use OAuth token
SparkApi.configure do |config|
  config.authentication_mode = SparkApi::Authentication::OAuth2
end

# create session
SparkApi.client.session = SparkApi::Authentication::OAuthSession.new({ :access_token => Settings.oauth_token })

# create contact
contact_id = SparkApi.client.post "/contacts", {"DisplayName": "Frank Test", "PrimaryEmail": "frank@test.com"}

# retrieve contact info
contact = SparkApi.client.get "/contacts/#{contact_id[0]["Id"]}"

# print contact info
p "Contact Created"
p "Id: " + contact[0]["Id"]
p "Name: " + contact[0]["DisplayName"]
p "Email: " + contact[0]["PrimaryEmail"]