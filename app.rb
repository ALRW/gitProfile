require 'sinatra'
require './lib/github_api_fetcher'

get '/' do
  send_file 'public/index.html'
end

get '/search' do
  content_type :json
  fetcher = GithubApiFetcher.new
  fetcher.request('search/users', params[:username], ENV['ACCESS_TOKEN'])
  fetcher.ok? ? fetcher.resp_body : (fail 'Request failed')
end

get '/search/profile' do
  content_type :json
  fetcher = GithubApiFetcher.new
  fetcher.request('users', params[:username], ENV['ACCESS_TOKEN'])
  fetcher.ok? ? fetcher.resp_body : (fail 'User Request Failed')
end
