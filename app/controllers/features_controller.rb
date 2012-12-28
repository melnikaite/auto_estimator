class FeaturesController < ApplicationController
  before_filter :find_feature, :only => [:update, :destroy]

  def create
    @feature = Feature.create(params[:feature])
  end

  def destroy
    @feature.destroy
  end

  private

  def find_feature
    @feature = Feature.find_by_id(params[:id]) || not_found
  end
end
