class Project < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :links, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :estimates, :dependent => :destroy
  validates_presence_of :title
  has_and_belongs_to_many :users
end
