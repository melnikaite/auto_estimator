class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(params[:project])
    if @project.persisted?
      flash[:notice] = "Project created"
      redirect_to root_path
    else
      flash[:error] = @project.errors.full_messages.join("<br />").html_safe
      render :new
    end
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project updated"
      redirect_to project_path(@project)
    else
      flash[:error] = @project.errors.full_messages.join("<br />").html_safe
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project deleted"
    redirect_to root_path
  end

  def show
    @contacts = @project.contacts
    @attachments = @project.attachments
    @links = @project.links
    @estimates = @project.estimates
  end

  private

  def find_project
    @project = Project.find_by_id(params[:id]) || not_found
  end
end
