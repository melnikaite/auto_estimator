require 'csv'
class Estimate < ActiveRecord::Base
  attr_accessible :project_id, :title
  belongs_to :project
  has_many :features, :dependent => :destroy
  validates_presence_of :project_id, :title

  def import(uploaded_io)
    existed_features = self.features.clone
    features = CSV.parse(uploaded_io.read).map do |row|
      feature = Feature.new(
        {
          :title => row[0],
          :optimistic => row[1],
          :most_likely => row[2],
          :pessimistic => row[3],
          :person => row[4]
        })
      feature.valid? ? feature : []
    end
    self.features << features
    self.features - existed_features
  end

  def export
    CSV.generate do |csv|
      self.features.each do |feature|
        csv << [feature.title, feature.optimistic, feature.most_likely, feature.pessimistic, feature.person]
      end
    end
  end
end
