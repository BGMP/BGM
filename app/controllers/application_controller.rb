class ApplicationController < ActionController::Base
  include ApplicationHelper
  include UsersHelper

  protect_from_forgery :with => :exception

  def index
    @projects = Project.all
    @projects = Kaminari.paginate_array(@projects).page(params[:page]).per(3)
  end

  def authenticate_admin
    redirect_to root_path, :notice => 'You do not have permission' unless user_is_admin?
  end

  def peek_enabled?
    current_user && current_user.admin?
  end
end
