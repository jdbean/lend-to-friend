# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  type        :string
#  user_id     :integer
#  title       :string
#  description :string
#  image       :string
#  author      :string
#  genre       :string
#
# Indexes
#
#  index_items_on_type_and_user  (type,)
#  index_items_on_user_id        (user_id)
#

class Movie < Item
  belongs_to :user
  has_many :loans
  has_many :borrowers, through: :loans, source: :user
end
