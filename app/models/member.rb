class Member < ApplicationRecord
  belongs_to :gym

  extend FriendlyId
  friendly_id :name, use: :slugged
end
