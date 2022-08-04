# frozen_string_literal: true

class User
  # User elements related to identity
  module Identity
    extend ActiveSupport::Concern

    USERNAME_REGEX = /\A([a-zA-Z0-9_]{1,16}|[0-9a-f]{24})\z/.freeze
    USERNAME_NORMALIZED_REGEX = /\A([a-z0-9_]{1,16}|[0-9a-f]{24})\z/.freeze
  end
end
