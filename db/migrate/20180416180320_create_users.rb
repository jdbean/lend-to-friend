class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      # t.string :email
      t.string :avatar
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zipcode
    end
  end
end
