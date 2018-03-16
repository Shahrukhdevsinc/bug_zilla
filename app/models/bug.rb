class Bug < ApplicationRecord
	
  belongs_to :project
  belongs_to :assignedto,
                :class_name => "User"
              
                belongs_to :createdby,
                :class_name => "User"
      validates :type,
      :inclusion  => { :in => [ 'Feature', 'Bug'],
    :message    => "%{value} is not a valid type" }
end
end
