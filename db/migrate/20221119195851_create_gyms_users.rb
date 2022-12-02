class CreateGymsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :gyms_users, id: false do |t|
      t.belongs_to :gym
      t.belongs_to :user
    end
  end
end
