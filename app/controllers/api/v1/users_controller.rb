class Api::V1::UsersController < ApplicationController



  def create
    #byebug
    @user = User.new(user_params)
    if @user.save
      #session[:user_id] = @user.id
      #flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      #redirect_to articles_path
      json_response "Signed Up successfully ......#{params.require(:user).permit(:username, :email, :password)}", true, {user: @user}, :ok
    else
      json_response "Something wrong", false, {}, :unprocessable_entity

      # else
      # render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
