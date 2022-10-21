class Project < ApplicationRecord
  extend FriendlyId

  friendly_id :name, :use => [:slugged, :finders]
  validates_format_of :name, :with => %r{\A[a-z0-9-/ ]+\z}i

  has_one :repository, :dependent => :destroy
  has_and_belongs_to_many :tags

  before_create :create_repository

  accepts_nested_attributes_for(:repository, :allow_destroy => false)
  validates :repository, :presence => true
  validates_associated :repository

  def create_repository
    build_repository(:title => name,
                     :description => repository.description,
                     :visible => repository.visible,
                     :provider => repository.provider,
                     :host => repository.host,
                     :namespace => repository.namespace,
                     :repo => repository.repo,
                     :open => repository.open,
                     :path => repository.path,
                     :branch => repository.branch,
                     :deployed => repository.deployed,
                     :auto_deploy => repository.auto_deploy)
  end
end
