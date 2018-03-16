class Project < ApplicationRecord
  belongs_to     :manager,
                :class_name => "User"
                
     has_many : project_user 
	 has_many : project_developers , through: : project_user
	 has_many :bugs
end
