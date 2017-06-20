class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    @user = find_user
    render :show
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save!
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    @user = find_user
    if user.update_attributes(user_params)
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    user = find_user
    user.destroy
    redirect_to root
  end
end

private

def find_user
  user = User.find(params[:id])
end
