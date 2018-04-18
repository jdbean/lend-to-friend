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
  has_many :households, class_name: 'Item'
  has_many :clothings, class_name: 'Item'

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  ## FIXME: These validations needs to be tested.
  validates_format_of :zip_code,
                      with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                      message: "should be 12345 or 12345-1234"
  validates :phone,
            format: {with: ^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$ },
            :allow_blank => true

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

  def get_clothings
    self.clothing_items.where("type = 'Clothing'")
  end

  def get_households
    self.household_items.where("type = 'Household'")
  end
end
