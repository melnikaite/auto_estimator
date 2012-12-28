class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :project_id, :skype, :state
  belongs_to :project
  validates_presence_of :first_name, :last_name, :project_id
end
