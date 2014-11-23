class Movie < ActiveRecord::Base
  has_many :uploaded_images

  default_scope {order('created_at desc')}

  def set_rotten_tomatos_attributes 
    rotten_tomatos_api = Api.new("tpd4ad6z3qchpq2uej94yyc7")
    @movie_object = rotten_tomatos_api.create_rt_movie_object("#{title}")

    if @movie_object.found?
      self.year = @movie_object.year
      self.length = @movie_object.runtime
      self.average_rating = @movie_object.audience_rating
      self.description = @movie_object.synopsis
      self.poster = @movie_object.poster

    end
  end

end
