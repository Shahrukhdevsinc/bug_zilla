class UsersController < ApplicationController
  def new
  	@new = User.new
  end

  def signup
  	 @user = User.new()
  	 @user.name=user_params[:name]
  	 @user.email=user_params[:email]
  	 @user.password=user_params[:password]
  	 @user.role=user_params[:role]



      if @user.save
        redirect_to users_login_path
        
      else
        redirect_to users_new_path
       
      end
    end
 

  def login
  end

  def logout
  end

  def user_params
      params.require(:user).permit(:name, :email, :password, :role)
    end
end
