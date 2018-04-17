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
  has_many :items

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
end
