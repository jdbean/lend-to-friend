class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :image
      t.string :author
      t.string :genre
      t.string :description 
    end
  end
end
