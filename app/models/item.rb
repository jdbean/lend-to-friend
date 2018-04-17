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

class Item < ApplicationRecord
  scope :books, -> { where(type: 'Book')}
  scope :games, -> { where(type: 'Game')}
  scope :movies, -> { where(type: 'Movie')}
  scope :households, -> { where(type: 'Household')}
  scope :clothings, -> { where(type: 'Clothing')}

  validates :title, presence: true
  def is_available?
    # Check to see if item's loan array is empty.
      # If empty, item is available for loan
      # If item has loans, it is unavailable if any loan has not been returned
      # If item has loans and all of them have been returned, item is available.
    if !self.loans.empty?
      self.loans.each do |loan|
        if !loan.returned
          return false
        end
      end
    end
    return true
  end

  def self.last_nine
    #returns the last 9 items added to the DB
    self.last(9)
  end

end
