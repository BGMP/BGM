class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    super do |user|
      user.build_profile
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:name])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:profile_attributes => [:id, :about_me, :gender, :public_email, :location, :discord, :github, :instagram, :crowdin, :steam, :twitter, :occupation, :interests]])
  end
end
