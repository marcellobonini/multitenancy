class Gym < ApplicationRecord
  has_many :users
  has_many :members
  validates_uniqueness_of :name, on: :create, message: "gym name must be unique"

end
