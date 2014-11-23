class UsersController < ApplicationController

  respond_to :html, :json
  before_action :require_login, only: [:edit, :logout]

  def welcome
    render "welcome"
  end

  def movies
    render text: 'asfd'
  end

  def index
    @users = User.all
    respond_with @users 
  end

  def new
  end

  def delete
    @user = User.find(params[:id]);
    @user.destroy
    reset_session
    redirect_to '/'
  end

  def edit
    return if !params[:share_status]
    @user.update({share_status: params[:share_status]})
    flash.now[:success] = "Your page is now #{params[:share_status]}." 
    render 'edit'
  end

  def create
    user = User.new({email: params[:email], password: params[:password], name: params[:name]})
    if user.save
      remember_user(user)
      flash[:success] = "You've created an account! Click your name to start logging movies!"
      redirect_to "/"
    else
      flash[:error] = "Your email has already been taken. Try again?"
      redirect_to "/users/new"
    end
  end

  def login
    existing_user = User.find_by_email_and_password(params[:email], params[:password])
    if existing_user
      flash[:success] = "You've been logged in."
      remember_user(existing_user)
      redirect_to "/"
    elsif User.find_by_email(params[:email])
      flash.now[:error] = "Wrong password, try again."
      render "login"
    else
      flash.now[:message] = "This email is not registered. Create an account?"
      render "login"
    end

  end

  def login_page
    render 'login'
  end

  def show
    @user_page = User.find_by_id(params[:id])
    @movies = Movie.where({user_id: @user_page.id})
    if @user_page.share_status == "private"
      require_login
    end
    respond_with @movies
  end

  def logout
    reset_session
    flash[:success] = "You've been logged out."
    redirect_to "/"
  end

  private

  def remember_user(user)
    session[:user_id] = user.id
  end


end
