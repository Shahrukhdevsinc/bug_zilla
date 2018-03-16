class BugsController < ApplicationController
before_action :require_login
	def show
		  @id=params[:id]
          @bugs=Bug.where(:project_id => params[:id])
	 end
   def new
      @id=params[:id]
   end
   def create_bug
     @bug = Bug.new
     @bug.title=params[:title]
     @bug.description=params[:description]
     @bug.bug_type=params[:type]
      
     
     @bug.assignedto_id = params[:assignto]
     @bug.project_id = params[:project_id]
      id=session[:user][0]['id']
     @bug.createdby_id = id
     @bug.screenshot=params[:picture]
     @bug.deadline = params[:bug]['deadline']
     #@bug.validate!
     if @bug.save 
     	redirect_to dashboard_home_path
    
     	
      end

   end
   def details
   	   @bugs=Bug.find(params[:id])
   	   @created=@bugs.createdby.name
   	   @assigned=@bugs.assignedto.name

   end


 private
	def require_login
  	   if !(session[:user])
  		redirect_to users_login_path
      end
  end
end
