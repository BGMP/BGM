# frozen_string_literal: true

module UsersHelper

  def by_username(username)
    User.where(:name => username).first if username
  end

  # NOTE: Admins will likely not lie about their github accounts lol, but it'd be nice to
  # add a separate field for them to have internal VCS accounts.
  def by_github(github)
    profiles = Profile.where(:github => github)

    user = nil
    profiles.each do |p|
      user = User.where(:id => p.user_id, :admin => true).first
    end

    user
  end

  def revision_author(github_name)
    user = by_github(github_name)
    return [user_color(user), user.name] if user

    nil
  end

  def username_color(username)
    user_color(by_username(username))
  end

  def user_color(user)
    return '' if user.nil?
    return '#dd7921' if user.admin?

    '#dd212d' if user.mod?
  end
end
