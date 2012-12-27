class Estimate < ActiveRecord::Base
  attr_accessible :project_id, :title
  belongs_to :project
  has_many :features, :dependent => :destroy
  validates_presence_of :project_id, :title
end
