class Tag < ApplicationRecord
  extend FriendlyId

  friendly_id :name, :use => [:slugged, :finders]

  has_and_belongs_to_many :project
end
