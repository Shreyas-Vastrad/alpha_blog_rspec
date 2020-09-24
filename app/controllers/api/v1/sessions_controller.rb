class Api::V1::SessionsController < ApplicationController


    def new
      json_response "Welcome to Login page", true, {}, :ok
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          json_response "Signed In Successfully", true, {user: user}, :ok
          #flash[:notice] = "Logged in successfully"
          #redirect_to user
        else
          json_response "Unauthorized", false, {}, :unauthorized
          #flash.now[:alert] = "There was something wrong with your login details"
          #render 'new'
        end
    end

    def destroy

        session[:user_id] = nil
        #user.generate_new_authentication_token
        json_response "Log out Successfully", true, {}, :ok
        #flash[:notice] = "Logged out"
        #redirect_to root_path
    end
end
#<ActionController::Parameters {"session"=><ActionController::Parameters {"email"=>"shreyasvastrad72@gmail.com", "password"=>"Shrey@96"} permitted: false>, "format"=>:json, "controller"=>"api/v1/sessions", "action"=>"create"} 
#permitted: false>