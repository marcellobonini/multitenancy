class User < ApplicationRecord
  belongs_to :gym
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def has_gym_assigned?
    if(self.gym == nil)
      return false
    else
      return true
    end
  end
  
end
