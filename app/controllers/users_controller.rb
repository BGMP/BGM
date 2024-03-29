class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  helper_method :username_color

  def members
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(20)
    @count = (@users.current_page - 1) * (@users.limit_value + 1)
  end

  def show
    @user = User.find_by!(:name => params[:name])
  end

  def new
    @user = User.new
    @user.build_profile
  end
end
