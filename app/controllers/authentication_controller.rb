class AuthenticationController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    
    if(!user)
      render json: {error: "Invalid Username"}, status: :unauthorized
    else
      if user.authenticate(params[:password])
        byebug
        secret_key = ENV['SECRET_KEY_BASE']
        token = JWT.encode({
          user_id: user.id,
          username: user.username,
        }, secret_key)
        render json: {token: token, username: user.username}
      else
        render json: {message: "Wrong Password"}, status: :unauthorized 
      end
    end
  end

  
end
