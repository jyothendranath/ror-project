class UserController < ApplicationController

    def profile
    user= User.find(params[:id])
    render json:user
    end

    def editprofile
        user= User.find(params[:id])
        render json:user.update(user_name:params[:user_name],email:params[:email],decsription:params[:decsription])
    end
end
