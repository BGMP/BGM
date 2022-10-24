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
  # @return [String] Pretty date string (i.e: April 21st, 2022 - 06:32 AM)
  def pretty_time(datetime)
    datetime.strftime("%B #{datetime.day.ordinalize}, %Y - %H:%M %p")
  end

  # @param content [String] Content
  # @return [String] Parsed html and/or markdown text
  def render_pretty(content, config = Sanitize::Config::RELAXED)
    Sanitize.clean(content, config)

    options = { :input => 'Kramdown', :parse_block_html => true }
    Kramdown::Document.new(content, options).to_html.html_safe
  end

  # Truncates a string to a set amount of characters. Finalising character is an ellipsis by default. If the string
  # is shorter than the max then it will effectively return itself.
  # @param string [String] The original string
  # @param max_length [Integer] The length to which we will truncate to
  # @param final_char [String] The string to append at the end of the truncated string, if truncated at all
  def truncate_string(string, max_length, final_char = '...')
    longer = string.length > max_length
    string = string[0..max_length]
    string += final_char if longer

    string
  end
end
