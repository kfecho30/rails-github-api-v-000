class RepositoriesController < ApplicationController
  def index
  end

  def create
    resp = Faraday.get("https://api.github.com/repos") do |req|
      req.params['oauth_token'] = session[:token]
    end
    @repos = JSON.parse(resp.body)
  end
end
