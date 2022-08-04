class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  helper_method :username_color

  def new_users
    @users = User.all
  end

  def show
    @user = User.find_by!(:name => params[:name])
  end

  def new
    @user = User.new
    @user.build_profile
  end
end
