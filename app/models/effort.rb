class Effort < ActiveRecord::Base
  attr_accessible :coefficient, :default_value, :title, :user_id
  belongs_to :feature
  validates_presence_of :coefficient, :default_value, :title, :user_id
end
