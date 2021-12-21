class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to dashboard_path, success: 'Project Created!'
    else
      render :new, status: 422
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :summary)
  end
end
