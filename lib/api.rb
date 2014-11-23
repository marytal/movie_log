require 'open-uri'
require 'movieobject.rb'

class Api
  def initialize(api_key="tpd4ad6z3qchpq2uej94yyc7")
    @api_key = "?apikey=#{api_key}"
  end

  def create_rt_movie_object(name)
    name = URI.encode(name)
    response = open("http://api.rottentomatoes.com/api/public/v1.0/movies.json#{@api_key}&q=#{name}&page_limit=1").read
    movie_object = MovieObject.new(JSON.parse(response)["movies"][0])
    return movie_object
  end

end