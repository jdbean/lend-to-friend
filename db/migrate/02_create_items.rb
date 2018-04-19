class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :type
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :image
      t.string :author
      t.string :genre
    end
    # add_index :items, [:type, :user]
  end
end
