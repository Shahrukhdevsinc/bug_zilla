class User < ApplicationRecord
	 include ActiveModel::Model
	has_many :owned_projects , :class_name => 'Projects', :foreign_key => 'manager_id'

	has_many :project_user 
	has_many :ongoing_projects , through: :project_user

	  has_many :created_bugs , :class_name => 'Bug', :foreign_key => 'createdby_id'
      has_many :assigned, :class_name => 'Bug', :foreign_key => 'assignedto_id'
      validates :role,
      :inclusion  => { :in => [ 'Manager', 'QA', 'Developer']}
  end
