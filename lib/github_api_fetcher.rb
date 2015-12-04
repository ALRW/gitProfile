require 'httparty'
require 'json'

class GithubApiFetcher
  include HTTParty

  attr_reader :base_url

  def initialize(base_url = 'https://api.github.com/search/users')
    @base_url = base_url
    @response = ''
  end

  def request(username, *key)
    self.response = HTTParty.get(build_url(username))
    response.message
  end

  def build_url(username, key = nil)
    return "#{base_url}?access_token=#{key}&q=#{username}" unless key.nil?
    "#{base_url}?q=#{username}"
  end

  def resp_body
    response.body
  end

  def ok?
    response.message == 'OK'
  end

  private

  attr_accessor :response
end
