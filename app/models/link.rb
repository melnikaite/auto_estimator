class Link < ActiveRecord::Base
  attr_accessible :project_id, :title, :url
  belongs_to :project
  validates_presence_of :project_id, :url
end
