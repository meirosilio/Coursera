class Recipe < ActiveRecord::Base
  include HTTParty

  key_value = 'ca923ec25afb0ba526368fd1f05ad1d8'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value.tr(' " ','')
  format :json

  def self.for(keyword)
    get("/search", query: {q: keyword})["recipes"]
  end

end
