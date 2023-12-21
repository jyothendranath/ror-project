class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
   
    def login
      command = AuthenticateUser.call(params[:email], params[:password])
   
      if command.success?
        # render json:  { auth_token: command.result }
        render json:{user:User.find_by(email:params[:email]),auth_token: command.result} 
        
      else
        render json: { error: command.errors }, status: :unauthorized
      end
       
    end

  def signup
    user=User.create(user_name:params[:user_name],email:params[:email],password:params[:password],decsription:params[:decsription])
    if (user).valid?
      
      render json: user
    else
      render json:{ error: "user must have email and user_name"}
          end

    end


  end


   