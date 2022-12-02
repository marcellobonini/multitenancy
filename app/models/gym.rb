class Gym < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :members

  accepts_nested_attributes_for :members

  validates_uniqueness_of :name, on: :create, message: "gym name is already taken"

  extend FriendlyId
  friendly_id :name, use: :slugged

end
