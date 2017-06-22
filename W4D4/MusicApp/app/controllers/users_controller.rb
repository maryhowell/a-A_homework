class UsersController < ApplicationController

  def show
    
  end

  def create
  end

  def new
  end

  def activate
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
