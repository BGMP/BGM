class ApplicationController < ActionController::Base
  include ApplicationHelper
  include UsersHelper

  def index
    @projects = Project.all.sort_by { |p| p.priority }
    @projects = Kaminari.paginate_array(@projects).page(params[:page]).per(6)
  end

  def authenticate_admin
    redirect_to root_path, :notice => 'You do not have permission' unless user_is_admin?
  end

  def peek_enabled?
    current_user && current_user.admin?
  end
end
