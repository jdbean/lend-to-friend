# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  avatar                 :string
#  phone                  :string
#  street_address         :string
#  city                   :string
#  state                  :string
#  zipcode                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :loans, foreign_key: "borrower_id", class_name: "Loan"
  has_many :borrowed_items, through: :loans, source: :item
  # has_many :shared_items, foreign_key: "lender_id", class_name: "Item"
  has_many :books, class_name: 'Item'
  has_many :games, class_name: 'Item'
  has_many :movies, class_name: 'Item'
  has_many :household_items, class_name: 'Item'
  has_many :clothing_items, class_name: 'Item'

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true

  paginates_per 5

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
