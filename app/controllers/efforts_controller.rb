class EffortsController < ApplicationController
  before_filter :find_effort, :only => [:update, :destroy]

  def create
    @effort = Effort.create(params[:effort])
  end

  def destroy
    @effort.destroy
  end

  private

  def find_effort
    @effort = Effort.find_by_id(params[:id]) || not_found
  end
end
