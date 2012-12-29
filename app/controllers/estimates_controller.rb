class EstimatesController < ApplicationController
  before_filter :find_estimate, :only => [:update, :destroy, :show, :import, :export]

  def create
    @estimate = Estimate.create(params[:estimate])
  end

  def destroy
    @estimate.destroy
  end

  def show
    @features = @estimate.features
  end

  def import
  end

  def export
  end

  private

  def find_estimate
    @estimate = Estimate.find_by_id(params[:id]) || not_found
  end
end
