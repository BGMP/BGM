class User < ApplicationRecord
  include Identity

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 3, :maximum => 16 }
  validates_format_of :name, :with => Identity::USERNAME_REGEX

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  has_one :profile, :dependent => :destroy
  before_create :create_profile

  accepts_nested_attributes_for(:profile, :update_only => true, :allow_destroy => false)

  def to_param
    name
  end

  def create_profile
    build_profile(:about_me => '',
                  :gender => '',
                  :public_email => '',
                  :location => '',
                  :discord => '',
                  :github => '',
                  :instagram => '',
                  :crowdin => '',
                  :steam => '',
                  :twitter => '',
                  :occupation => '',
                  :interests => '')
  end
end
