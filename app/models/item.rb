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

  # delegate :type, to: :loan, prefix: true

  def is_available?
    # Check to see if item's loan array is empty.
      # If empty, item is available for loan
      # If item has loans, it is unavailable if any loan has not been returned
      # If item has loans and all of them have been returned, item is available.
    if !self.get_loans.empty?
      self.get_loans.each do |loan|
        if !loan.returned
          return false
        end
      end
    end
    return true
  end

  def get_loans
    Loan.find_by_sql("SELECT * FROM loans WHERE loans.item_id = #{self.id}")
  end


  def self.loans_by_day
    collection = self.all.collect do |loan|
      loan.get_loans
    end
    group_by_day(collection.flatten)
  end

  # def self.last_nine
  #   #returns the last 9 items added to the DB
  #   self.last(9)
  # end
  #
  def self.by_type
    self.group(:type)
  end

  # def self.type_by_loan_date
  #   self.item_by_type.each do |type|
  #     type
  #   end
  # end

end
