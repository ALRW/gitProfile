require 'httparty'
require 'json'

class GithubApiFetcher
  include HTTParty

  attr_reader :base_url

  def initialize(base_url = 'https://api.github.com')
    @base_url = base_url
    @response = ''
  end

  def request(url, username, key=nil)
    self.response = HTTParty.get(build_url(url, username, key))
    response.message
  end

  def build_url(url, username, key)
    if url == 'users'
      return "#{base_url}/#{url}/#{username}?access_token=#{key}" unless key.nil?
    elsif url == 'search/users'
      return "#{base_url}/#{url}?access_token=#{key}&q=#{username}" unless key.nil?
    end
  end

  def resp_body
    p response.body
  end

  def ok?
    response.message == 'OK'
  end

  private

  attr_accessor :response
end
