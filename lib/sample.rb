require_relative 'expirable_token'

token = ExpirableToken.new('1234', nil)

new_token = ExpirableToken.from_token(token.encode)

print "#{token.id} = #{new_token.id}\n"

curl -u jlaso https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials