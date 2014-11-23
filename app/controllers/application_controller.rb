class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :recall_user

  

  def require_login
    unless @user
      flash[:error] = 'You must be logged in to do this'
      redirect_to '/'
      return false
    end
  end

  def require_matching_login
    if @user.id != params[:id]
      flash[:error] = "You do not have access to this user's accound"
      return false
    end
  end

  protected

  def recall_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

end
