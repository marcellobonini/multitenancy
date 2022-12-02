class User < ApplicationRecord
  has_and_belongs_to_many :gyms, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email, on: :create, message: "user with this email already exists"

  enum :role, { tenant: 0, employee: 10, superadmin: 50 }

end
