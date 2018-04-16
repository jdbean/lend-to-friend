# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  image       :string
#  author      :string
#  genre       :string
#  description :string
#
# Indexes
#
#  index_items_on_user_id  (user_id)
#

class Item < ApplicationRecord
  belongs_to :user
  has_many :loans
  has_many :borrowers, through: :loans, source: :user
end
