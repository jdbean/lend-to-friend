# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
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
