class Project < ApplicationRecord
  belongs_to     :manager,
                :class_name => "User"
                
     has_many :project_user , dependent: :destroy
	 has_many :users , :through=> :project_user
	 has_many :bugs , dependent: :destroy
end
