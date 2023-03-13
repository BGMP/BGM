class ProjectsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :authenticate_admin, :except => [:index, :show]
  before_action :set_project, :only => [:show, :edit, :update, :destroy]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    @projects = Kaminari.paginate_array(@projects).page(params[:page]).per(10)
  end

  # GET /projects/1 or /projects/1.json
  def show
    @project = Project.friendly.find(params[:slug])
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.build_repository(@project.name)
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), :notice => "Project was successfully created." }
        format.json { render :show, :status => :created, :location => @project }
      else
        format.html { render :new, :status => :unprocessable_entity }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), :notice => "Project was successfully updated." }
        format.json { render :show, :status => :ok, :location => @project }
      else
        format.html { render :edit, :status => :unprocessable_entity }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, :notice => "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:slug])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    # params.fetch(:project, {})
    params.require(:project).permit(:name, :description, :long_desc, :priority, :readme, :slug, :tag_ids => [], :repository_attributes => [:id, :title, :description, :visible, :provider, :host, :namespace, :repo, :open, :path, :branch, :deployed, :auto_deploy, :slug])
  end
end
