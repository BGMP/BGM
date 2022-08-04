class Repository < ApplicationRecord
  include FriendlyId

  BASE_PATH = 'C:/Users/BGM'.freeze

  friendly_id :title, :use => [:slugged, :finders]

  belongs_to :project
  validates_uniqueness_of :project_id, :message => 'Repositories can only be associated to one project!'
end
