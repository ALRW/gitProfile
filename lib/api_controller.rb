require 'HTTParty'

class ApiController
  include HTTParty

  attr_reader :base_url
  def initialize
    @base_url = 'https://api.github.com/search/users'
  end

  def request(username, *key)
    response = HTTParty.get(build_url(username))
    response.message
  end

  def build_url(username, key='')
    return "#{base_url}?access_token=#{key}&q=#{username}" unless key == ''
    "#{base_url}?q=#{username}"
  end
end
