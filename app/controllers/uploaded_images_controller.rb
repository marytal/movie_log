class UploadedImagesController < ApplicationController

  before_action :create, only: [:create_movie_poster, :create_profile_picture]

  def new
  end

  def create
    if !params[:uploaded_image]
      flash[:error] = "You must upload an image. All other fields do not require a submit."
      @movie_id = params[:movie_id]
      return;
    end

    @uploaded_image = UploadedImage.new
    @uploaded_image.image = params[:uploaded_image].read
    @uploaded_image.mime_type = params[:uploaded_image].content_type
    @uploaded_image.user_id = @user.id
    @uploaded_image.movie_id = params[:movie_id];
    @uploaded_image.save



  end

  def create_profile_picture

    return redirect_to "/users/#{@user.id}/edit" if !@uploaded_image

    flash[:success] = "Profile picture saved."
    @uploaded_image.update({used_for: "profile"})
    @user.update({profile_picture: "/uploaded_images/#{@uploaded_image.id}"})
    redirect_to "/users/#{@user.id}/edit"
  end

  def create_movie_poster

    return redirect_to "/movies/#{@movie_id}/edit" if !@uploaded_image

    flash[:success] = "Movie poster saved."
    @uploaded_image.update({used_for: "poster"})
    @movie = Movie.find(params[:movie_id])
    @movie.update({poster: "/uploaded_images/#{@uploaded_image.id}"})
    redirect_to "/movies/#{@movie.id}/edit"
  end

  def show
    image = UploadedImage.find(params[:id])
    send_data(image.image, type: image.mime_type, disposition: 'inline')
  end
end
