class Item < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_many :borrowers, through: :loans, source: :user
end
