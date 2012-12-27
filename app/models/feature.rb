class Feature < ActiveRecord::Base
  attr_accessible :estimate_id, :most_likely, :optimistic, :person, :pessimistic, :title
  belongs_to :estimate
  has_many :efforts, :dependent => :destroy
end
