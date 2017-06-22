class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash[:errors] = ['Invalid Creds']
    elsif !user.activated?
      redirect_to root_url, alert: "You must activate your account first! Check your email."
    else
      logged_in(user)
      redirect_to root_url
    end
  end

  def destroy
   current_user.reset_session_token!
   session[:session_token] = nil

   redirect_to new_session_url
  end

  def new
    render :new
  end

end
