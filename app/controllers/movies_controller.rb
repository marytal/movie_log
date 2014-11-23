require 'date'
require 'pathname'

class MoviesController < ApplicationController

  before_action :require_login, only: [:create, :edit, :copy]
  
  path = File.join(Rails.root, 'lib', 'movies.txt')
  @@movies = (open(path)).read.split("\n")

  respond_to :json, :html

  def index
    @movies = Movie.where(['1=1'])
    if params[:user_id]
      @movies = @movies.where(user_id: params[:user_id])
    end
    respond_with @movies
  end

  def new
  end

  def show
    @movie = Movie.find_by_id(params[:id])
    respond_with @movie
  end

  def create
    @movie = Movie.new(title: params[:movie_title], user_id: @user.id, notes: "")
    @movie.set_rotten_tomatos_attributes
    @movie.save
    @movie.update({date_watched: @movie.created_at});
    
    redirect_to "/movies/#{@movie.id}/edit"
  end

  def edit
    @movie = Movie.find_by_id(params[:id])
  end

  def update
    @movie = Movie.find_by_id(params[:id])
    @movie.update(params[:movie].permit(:title, :description, :notes, :year, :date_watched, :watched_with, :your_rating, :average_rating))
    redirect_to "/movies/#{@movie.id}/edit"
  end

  def search

    if params[:term]
      text_field_input = params[:term]

      @matched_movies = @@movies.select do |title|
        title.match(/(#{text_field_input})/i)
      end

      @matched_movies = @matched_movies[0..4]

      respond_with @matched_movies
    end
  end

  def destroy
    @movie = Movie.find_by_id(params[:id])
    @movie.destroy
    redirect_to "/users/#{@user.id}"
  end

  def copy
    @movie = Movie.find_by_id(params[:id])
    @new_movie = @movie.dup
    @new_movie.user_id = @user.id
    @new_movie.save
    flash[:success] = "Movie successfully copied."
    redirect_to "/movies/#{@new_movie.id}"
  end

end
