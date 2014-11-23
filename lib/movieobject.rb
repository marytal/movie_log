class MovieObject
  def initialize(object)
    @object = object
  end

  def found?
    @object == nil ? false :true
  end

  def put_object
    @object
  end

  def title
    @object["title"]
  end

  def main_character
    @object["abridged_cast"][0]["characters"][0]
  end

  def year
    @object["year"]
  end

  def runtime
    @object["runtime"]
  end

  def audience_rating
    @object["ratings"]["audience_score"]
  end

  def synopsis
    @object["synopsis"]
  end

  def poster
    @object["posters"]["profile"]
  end

end