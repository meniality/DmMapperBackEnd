class AuthenticationController < ApplicationController

  def login
    user = User.find_by(username: params[:username])

    if(!user)
      render json: {error: "Invalid Username"}, status: :unauthorized
    else
      if user.authenticate(params[:password])
        render json: {message: "Correct Password!"}
      else
        render json: {message: "Wrong Password"}, status: :unauthorized 
      end
    end
  end

  
end
