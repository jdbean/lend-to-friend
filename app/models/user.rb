class User < ApplicationRecord
  has_many :loans, foreign_key: "borrower_id", class_name: "Loan"
  has_many :borrowed_items, through: :loans, source: :item
  # has_many :shared_items, foreign_key: "lender_id", class_name: "Item"
  has_many :items
end
