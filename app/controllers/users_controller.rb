class UsersController < ApplicationController
  
  def create
    user = User.create(user_params)

    render json: {username: user.id}
  end

  def index
    users = User.all 
    render json: users
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
