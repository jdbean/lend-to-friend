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
  has_many :books, class_name: 'Item'
  has_many :games, class_name: 'Item'
  has_many :movies, class_name: 'Item'
  has_many :household_items, class_name: 'Item'
  has_many :clothing_items, class_name: 'Item'

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.item_count
    hash = {}
    self.all.each do |user|
      hash[user.name] = user.items.length
    end
    hash
  end

  def items
    #returns all items regardless of type
    self.books
  end

  def get_books
    self.books.where("type = 'Book'")
  end

  def get_games
    self.games.where("type = 'Game'")
  end

  def get_movies
    self.movies.where("type = 'Movie'")
  end

  def get_clothing_items
    self.clothing_items.where("type = 'ClothingItem'")
  end

  def get_household_items
    self.household_items.where("type = 'HouseholdItem'")
  end
end
