class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :skype
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :projects
end
