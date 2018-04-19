class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :item, foreign_key: true
      t.belongs_to :borrower
      t.integer :rating
      t.datetime :loaned
      t.datetime :returned
      t.boolean :overdue, default: false
    end
  end
end
