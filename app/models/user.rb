# Scheme Information
# t.string "name"
# t.string "email"
# t.string "avatar"
# t.string "phone"
# t.string "streetaddress"
# t.string "city"
# t.string "state"
# t.string "zipcode"

class User < ApplicationRecord
  has_many :loans, foreign_key: "borrower_id", class_name: "Loan"
  has_many :borrowed_items, through: :loans, source: :item
  # has_many :shared_items, foreign_key: "lender_id", class_name: "Item"
  has_many :items

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  def self.item_count
    hash = {}
    self.all.each do |user|
      hash[user.name] = user.items.length
    end
    hash
  end
end
