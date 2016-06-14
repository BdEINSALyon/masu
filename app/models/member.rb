class Member < ActiveRecord::Base

  belongs_to :study_year
  belongs_to :department
  has_many :subscriptions
  has_many :memberships, through: :subscriptions, class_name: 'Membership'
  has_many :excluded_memberships, through: :memberships, class_name: 'Membership'

  validates_presence_of :name, :first_name
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, presence: true
  validates_uniqueness_of :student_card
  validates_uniqueness_of :phone
  validates_inclusion_of :gender, in: %w{M W}

end
