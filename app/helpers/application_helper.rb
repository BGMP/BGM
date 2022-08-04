module ApplicationHelper
  include UsersHelper
  include RepositoriesHelper

  require 'kramdown'

  # Check if the passed user is an admin
  # @return [Boolean] true if the current user is an admin, false otherwise
  def user_is_admin?(user = current_user)
    user && user.admin?
  end

  # @return [String] the mounting path of the forums engine (i.e. /forums)
  def forums_path
    Thredded::Engine.routes.find_script_name({}).to_s
  end

  # @param datetime [DateTime]
  # @return [String] Pretty date string (i.e: Thursday 21st, 2022 - 06:32 AM)
  def pretty_time(datetime)
    datetime.strftime("%A #{datetime.day.ordinalize}, %Y - %H:%M %p")
  end

  # @param content [String] Content
  # @return [String] Parsed html and/or markdown text
  def render_pretty(content, config = Sanitize::Config::RELAXED)
    Sanitize.clean(content, config)

    options = { :input => 'Kramdown', :parse_block_html => true }
    Kramdown::Document.new(content, options).to_html.html_safe
  end
end
