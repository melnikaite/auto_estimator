class Attachment < ActiveRecord::Base
  attr_accessible :file_name, :project_id, :state, :title, :user_id
  belongs_to :project
  belongs_to :user
  validates_presence_of :file_name, :state, :user_id
end
