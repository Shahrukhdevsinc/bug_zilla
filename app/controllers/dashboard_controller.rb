class DashboardController < ApplicationController
	 before_action :require_login
  def home
     @user=session[:user][0]     
     @role=@user['role']
     if(@role == 'Manager')
          @projects= User.find(@user['id']).owned_projects
      else
      	@projects=User.find(@user['id']).projects
     end
      end


      def project_details
      	   @project=Project.find(params[:id])
           @manager=@project.manager[:name]
           @users=@project.users;
           @bugs=@project.bugs
      end

  private
  def require_login
  	if !(session[:user])
  		redirect_to users_login_path
      end
  end
end
