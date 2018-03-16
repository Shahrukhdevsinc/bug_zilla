class ProjectsController < ApplicationController
	before_action :require_login
  def new

  end

  def create
    @p=params
    @pr=Project.new
    @pr.name=params[:name]
    @pr.description=params[:description]
    @pr.manager_id=session[:user][0]['id']
    if @pr.save
    	p_u=ProjectUser.new
    	 params[:user_ids].each do |i|
                p_u.project_id=@pr.id
                p_u.user_id=i
                  if ! p_u.save
                 
                  		@pr.destroy
                  		redirect_to projects_new_path
                  	end  
                  end
                  redirect_to dashboard_home_path
              else
              	redirect_to projects_new_path
             end
        
     end

  def destroy
     if(session[:user][0]['id'] == Project.find(params[:id]).manager_id)
     Project.destroy(params[:id])
        else
          flash[:notice]= "Youcan only delete the project you created"
      end
      redirect_to  dashboard_home_path
  end
 private
   def require_login
  	if !(session[:user].present?)
      flash[:notice]= "You must logged in to continue"
  		redirect_to users_login_path
    else
       if
        session[:user][0]['role'] != 'Manager'
        flash[:notice]= "Only manager have an access to create/delete project"
        redirect_to dashboard_home_path
        end
    end

    end
  end

