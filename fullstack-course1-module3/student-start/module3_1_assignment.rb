require 'httparty'

class Recipe
  include HTTParty
  hostport = ENV['FOOD2FORK_KEY']
  base_uri "http://food2fork.com/api"
  default_params key: hostport
  format :json

  def self.for(keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
