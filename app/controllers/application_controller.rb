class ApplicationController < ActionController::API
  def authenticate
    authorization_header = request.headers[:authorization]

    if !authorization_header

      render status: :unauthorized
    else
      
      token = authorization_header.split(' ')[1]
      secret_key = ENV['SECRET_KEY_BASE']
      decoded_token = JWT.decode(token, secret_key)[0]
      @user = User.find(decoded_token["user_id"])
      
      if !@user
        render status: :unauthorized
      end
    end
  end 
end
