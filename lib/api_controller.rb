require 'HTTParty'
require 'json'

class ApiController
  include HTTParty

  attr_reader :base_url, :response
  def initialize
    @base_url = 'https://api.github.com/search/users'
    @response = ''
  end

  def request(username, *key)
    self.response = HTTParty.get(build_url(username))
    response.message
  end

  def build_url(username, key='')
    return "#{base_url}?access_token=#{key}&q=#{username}" unless key == ''
    "#{base_url}?q=#{username}"
  end

  private
  attr_writer :response
end
